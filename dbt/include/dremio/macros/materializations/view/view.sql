<<<<<<< HEAD
{% materialization view, adapter='dremio' %}
  {%- set identifier = model['alias'] -%}
  {%- set twin_strategy = config.get('twin_strategy', validator=validation.any[basestring]) or 'clone' -%}
  {%- set old_relation = adapter.get_relation(database=database, schema=schema, identifier=identifier) -%}

  {%- set exists_as_view = (old_relation is not none and old_relation.is_view) -%}

  {%- set target_relation = api.Relation.create(
      identifier=identifier, schema=schema, database=database, type='view') -%}

  {{ run_hooks(pre_hooks) }}

  -- If there's a table with the same name and we weren't told to full refresh,
  -- that's an error. If we were told to full refresh, drop it. This behavior differs
  -- for Snowflake and BigQuery, so multiple dispatch is used.
  {%- if old_relation is not none and old_relation.is_table -%}
    {{ handle_existing_table(should_full_refresh(), old_relation) }}
  {%- endif -%}

  -- build model
  {% call statement('main') -%}
    {{ create_view_as(target_relation, sql) }}
  {%- endcall %}

  {{ view_twin_strategy(twin_strategy) }}

  {{ run_hooks(post_hooks) }}

  {{ return({'relations': [target_relation]}) }}

{% endmaterialization %}
=======
{% materialization view, adapter='dremio' -%}
    {{ return(create_or_replace_view()) }}
{%- endmaterialization %}
>>>>>>> e8b196d307d9e0471f88722c45fdb43ac33c63dc
