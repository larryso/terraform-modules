# Tagging enforcement Module

## Dependencies
NON dependencies

## Input

## output
|variable|Description|
|--------|-----------|
|tags|generated, validated tags|

## Usage

```
module "ali_tags"{
    source = "../ali_tags"

    tags = var.tags
    module_tags = local.default_tags
}

resource ... {
    ...
    tags = ali_tags.tags
}
```
