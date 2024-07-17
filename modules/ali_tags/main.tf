locals{
    clean_module_tags = { for k, v in var.module_tags : k=>v if v != null}

    caller_tf_module_name = lookup(local.clean_module_tags, "TFComponent", "")
    tag_filter = local.caller_tf_module_name == "ali_kms_secrets" || local.caller_tf_module_name == ""
    # removed "PipelineTags" and "ExtraTags"
    main_tags = local.tag_filter ? {
        for k,v in var.tags : k=>v if contains(["APMID", "EnvironmentGroup", "RresourceGroup"], k)
    }:{
        for k,v in var.tags : k=>v if !contains(["PipelineTags", "ExtraTags"], k)
    }
    # removed null value
    clean_tags = {for k,v in local.main_tags: k=>v if v != null}

    final_tags = {for k,v in local.clean_tags: k=> k!= "DataPII" ? v: title(v)}

    resulting_tags = local.tag_filter ? merge(
        local.final_tags,
        contains(keys(local.clean_module_tags), "TFComponent") ? {"TFComponent" = local.clean_module_tags.TFComponent} : {},
        contains(keys(local.clean_module_tags), "TFModulesVersion") ? {"TFModulesVersion" = local.clean_module_tags.TFModulesVersion} : {}
    ): merge(
        var.tags.ExtraTags,
        var.tags.PipelineTags,
        local.final_tags,
        contains(keys(local.clean_module_tags), "TFComponent") ? {"TFComponent" = local.clean_module_tags.TFComponent} : {},
        contains(keys(local.clean_module_tags), "TFModulesVersion") ? {"TFModulesVersion" = local.clean_module_tags.TFModulesVersion} : {}
    )
}