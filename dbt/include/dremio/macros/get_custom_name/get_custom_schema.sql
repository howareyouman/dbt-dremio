{% macro dremio__generate_schema_name(custom_schema_name, node) -%}
<<<<<<< HEAD
  {%- set default_schema = target.schema
    if node.config.materialized in ['view', 'raw_reflection', 'aggregation_reflection']
    else target.root_path -%}
  {%- set custom_schema_name = custom_schema_name
    if node.config.materialized in ['view', 'raw_reflection', 'aggregation_reflection']
    else node.config.root_path -%}
  {{ generate_schema_name_impl(default_schema, custom_schema_name, node) }}
{%- endmacro %}

{% macro generate_schema_name_impl(default_schema, custom_schema_name=none, node=none) -%}
  {%- if custom_schema_name is none -%}

      {{ default_schema }}

  {%- else -%}

      {{ custom_schema_name }}

  {%- endif -%}
=======

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

>>>>>>> e8b196d307d9e0471f88722c45fdb43ac33c63dc
{%- endmacro %}
