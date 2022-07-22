
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Azure Sql Server

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [Connection Failed](#connection-failed) | True | 3  | `sum(last_30m):sum:azure.sql_servers_databases.connection_failed{tag:xxx} by {subscription_name,server_name}.as_count() > 10.0` |
| [Deadlocks](#deadlocks) | True | 3  | `sum(last_5m):sum:azure.sql_servers_databases.deadlock{tag:xxx} by {subscription_name,server_name}.as_count() > ` |
| [Dtu Percentage](#dtu-percentage) | True | 2  | `avg(last_30m):avg:azure.sql_servers_databases.dtu_consumption_percent{tag:xxx} by {subscription_name,server_name} > 95.0` |
| [Log Io Percent](#log-io-percent) | True | 3  | `avg(last_30m):avg:azure.sql_servers_databases.log_write_percent{tag:xxx} by {subscription_name,server_name} > 90.0` |
| [Sessions Percentage](#sessions-percentage) | True | 3  | `avg(last_30m):avg:azure.sql_servers_databases.sessions_percent{tag:xxx} by {subscription_name,server_name} > 95.0` |
| [Storage Percentage](#storage-percentage) | True | 2  | `max(last_5m):avg:azure.sql_servers_databases.storage_percent{tag:xxx} by {subscription_name,server_name} > 95.0` |
| [Workers Percentage](#workers-percentage) | True | 3  | `avg(last_30m):avg:azure.sql_servers_databases.workers_percent{tag:xxx} by {subscription_name,server_name} > 90.0` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Connection Failed

Query:
```terraform
sum(last_30m):sum:azure.sql_servers_databases.connection_failed{tag:xxx} by {subscription_name,server_name}.as_count() > 10.0
```

| variable                                        | default  | required | description                      |
|-------------------------------------------------|----------|----------|----------------------------------|
| connection_failed_enabled                       | True     | No       |                                  |
| connection_failed_warning                       | None     | No       |                                  |
| connection_failed_critical                      | 10.0     | No       |                                  |
| connection_failed_evaluation_period             | last_30m | No       |                                  |
| connection_failed_note                          | ""       | No       |                                  |
| connection_failed_docs                          | ""       | No       |                                  |
| connection_failed_filter_override               | ""       | No       |                                  |
| connection_failed_alerting_enabled              | True     | No       |                                  |
| connection_failed_no_data_timeframe             | None     | No       |                                  |
| connection_failed_notify_no_data                | False    | No       |                                  |
| connection_failed_ok_threshold                  | None     | No       |                                  |
| connection_failed_name_prefix                   | ""       | No       |                                  |
| connection_failed_name_suffix                   | ""       | No       |                                  |
| connection_failed_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| connection_failed_notification_channel_override | ""       | No       |                                  |


## Deadlocks

Query:
```terraform
sum(last_5m):sum:azure.sql_servers_databases.deadlock{tag:xxx} by {subscription_name,server_name}.as_count() > 
```

| variable                                | default  | required | description                      |
|-----------------------------------------|----------|----------|----------------------------------|
| deadlocks_enabled                       | True     | No       |                                  |
| deadlocks_warning                       | None     | No       |                                  |
| deadlocks_critical                      | 0.0      | No       |                                  |
| deadlocks_evaluation_period             | last_5m  | No       |                                  |
| deadlocks_note                          | ""       | No       |                                  |
| deadlocks_docs                          | ""       | No       |                                  |
| deadlocks_filter_override               | ""       | No       |                                  |
| deadlocks_alerting_enabled              | True     | No       |                                  |
| deadlocks_no_data_timeframe             | None     | No       |                                  |
| deadlocks_notify_no_data                | False    | No       |                                  |
| deadlocks_ok_threshold                  | None     | No       |                                  |
| deadlocks_name_prefix                   | ""       | No       |                                  |
| deadlocks_name_suffix                   | ""       | No       |                                  |
| deadlocks_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| deadlocks_notification_channel_override | ""       | No       |                                  |


## Dtu Percentage

Query:
```terraform
avg(last_30m):avg:azure.sql_servers_databases.dtu_consumption_percent{tag:xxx} by {subscription_name,server_name} > 95.0
```

| variable                                     | default  | required | description                      |
|----------------------------------------------|----------|----------|----------------------------------|
| dtu_percentage_enabled                       | True     | No       |                                  |
| dtu_percentage_warning                       | 90.0     | No       |                                  |
| dtu_percentage_critical                      | 95.0     | No       |                                  |
| dtu_percentage_evaluation_period             | last_30m | No       |                                  |
| dtu_percentage_note                          | ""       | No       |                                  |
| dtu_percentage_docs                          | ""       | No       |                                  |
| dtu_percentage_filter_override               | ""       | No       |                                  |
| dtu_percentage_alerting_enabled              | True     | No       |                                  |
| dtu_percentage_no_data_timeframe             | None     | No       |                                  |
| dtu_percentage_notify_no_data                | False    | No       |                                  |
| dtu_percentage_ok_threshold                  | None     | No       |                                  |
| dtu_percentage_name_prefix                   | ""       | No       |                                  |
| dtu_percentage_name_suffix                   | ""       | No       |                                  |
| dtu_percentage_priority                      | 2        | No       | Number from 1 (high) to 5 (low). |
| dtu_percentage_notification_channel_override | ""       | No       |                                  |


## Log Io Percent

Query:
```terraform
avg(last_30m):avg:azure.sql_servers_databases.log_write_percent{tag:xxx} by {subscription_name,server_name} > 90.0
```

| variable                                     | default  | required | description                      |
|----------------------------------------------|----------|----------|----------------------------------|
| log_io_percent_enabled                       | True     | No       |                                  |
| log_io_percent_warning                       | None     | No       |                                  |
| log_io_percent_critical                      | 90.0     | No       |                                  |
| log_io_percent_evaluation_period             | last_30m | No       |                                  |
| log_io_percent_note                          | ""       | No       |                                  |
| log_io_percent_docs                          | ""       | No       |                                  |
| log_io_percent_filter_override               | ""       | No       |                                  |
| log_io_percent_alerting_enabled              | True     | No       |                                  |
| log_io_percent_no_data_timeframe             | None     | No       |                                  |
| log_io_percent_notify_no_data                | False    | No       |                                  |
| log_io_percent_ok_threshold                  | None     | No       |                                  |
| log_io_percent_name_prefix                   | ""       | No       |                                  |
| log_io_percent_name_suffix                   | ""       | No       |                                  |
| log_io_percent_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| log_io_percent_notification_channel_override | ""       | No       |                                  |


## Sessions Percentage

Query:
```terraform
avg(last_30m):avg:azure.sql_servers_databases.sessions_percent{tag:xxx} by {subscription_name,server_name} > 95.0
```

| variable                                          | default  | required | description                      |
|---------------------------------------------------|----------|----------|----------------------------------|
| sessions_percentage_enabled                       | True     | No       |                                  |
| sessions_percentage_warning                       | None     | No       |                                  |
| sessions_percentage_critical                      | 95.0     | No       |                                  |
| sessions_percentage_evaluation_period             | last_30m | No       |                                  |
| sessions_percentage_note                          | ""       | No       |                                  |
| sessions_percentage_docs                          | ""       | No       |                                  |
| sessions_percentage_filter_override               | ""       | No       |                                  |
| sessions_percentage_alerting_enabled              | True     | No       |                                  |
| sessions_percentage_no_data_timeframe             | None     | No       |                                  |
| sessions_percentage_notify_no_data                | False    | No       |                                  |
| sessions_percentage_ok_threshold                  | None     | No       |                                  |
| sessions_percentage_name_prefix                   | ""       | No       |                                  |
| sessions_percentage_name_suffix                   | ""       | No       |                                  |
| sessions_percentage_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| sessions_percentage_notification_channel_override | ""       | No       |                                  |


## Storage Percentage

Query:
```terraform
max(last_5m):avg:azure.sql_servers_databases.storage_percent{tag:xxx} by {subscription_name,server_name} > 95.0
```

| variable                                         | default  | required | description                      |
|--------------------------------------------------|----------|----------|----------------------------------|
| storage_percentage_enabled                       | True     | No       |                                  |
| storage_percentage_warning                       | 90.0     | No       |                                  |
| storage_percentage_critical                      | 95.0     | No       |                                  |
| storage_percentage_evaluation_period             | last_5m  | No       |                                  |
| storage_percentage_note                          | ""       | No       |                                  |
| storage_percentage_docs                          | ""       | No       |                                  |
| storage_percentage_filter_override               | ""       | No       |                                  |
| storage_percentage_alerting_enabled              | True     | No       |                                  |
| storage_percentage_no_data_timeframe             | None     | No       |                                  |
| storage_percentage_notify_no_data                | False    | No       |                                  |
| storage_percentage_ok_threshold                  | None     | No       |                                  |
| storage_percentage_name_prefix                   | ""       | No       |                                  |
| storage_percentage_name_suffix                   | ""       | No       |                                  |
| storage_percentage_priority                      | 2        | No       | Number from 1 (high) to 5 (low). |
| storage_percentage_notification_channel_override | ""       | No       |                                  |


## Workers Percentage

Query:
```terraform
avg(last_30m):avg:azure.sql_servers_databases.workers_percent{tag:xxx} by {subscription_name,server_name} > 90.0
```

| variable                                         | default  | required | description                      |
|--------------------------------------------------|----------|----------|----------------------------------|
| workers_percentage_enabled                       | True     | No       |                                  |
| workers_percentage_warning                       | None     | No       |                                  |
| workers_percentage_critical                      | 90.0     | No       |                                  |
| workers_percentage_evaluation_period             | last_30m | No       |                                  |
| workers_percentage_note                          | ""       | No       |                                  |
| workers_percentage_docs                          | ""       | No       |                                  |
| workers_percentage_filter_override               | ""       | No       |                                  |
| workers_percentage_alerting_enabled              | True     | No       |                                  |
| workers_percentage_no_data_timeframe             | None     | No       |                                  |
| workers_percentage_notify_no_data                | False    | No       |                                  |
| workers_percentage_ok_threshold                  | None     | No       |                                  |
| workers_percentage_name_prefix                   | ""       | No       |                                  |
| workers_percentage_name_suffix                   | ""       | No       |                                  |
| workers_percentage_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| workers_percentage_notification_channel_override | ""       | No       |                                  |


## Module Variables

| variable                   | default          | required | description                                                                                          |
|----------------------------|------------------|----------|------------------------------------------------------------------------------------------------------|
| filter_str                 |                  | Yes      |                                                                                                      |
| env                        |                  | Yes      | This refers to the environment or which stage of deployment this monitor is checking. Good values are prd, acc, tst, dev... |
| service                    | Azure SQL Server | No       | Service name of what you're monitoring. This also sets the service:<service> tag on the monitor      |
| service_display_name       | None             | No       | Readable version of service name of what you're monitoring.                                          |
| notification_channel       | ""               | No       | Channel to which datadog sends alerts, will be overridden by alerting_enabled if that's set to false |
| additional_tags            | []               | No       | Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags |
| locked                     | True             | No       | Makes sure only the creator or admin can modify the monitor                                          |
| name_prefix                | ""               | No       | Can be used to prefix to the Monitor name                                                            |
| name_suffix                | ""               | No       | Can be used to suffix to the Monitor name                                                            |
| service_check_include_tags |                  | Yes      | Tags to be included in the \"over\" section of a service check query                                 |
| service_check_exclude_tags | []               | No       | Tags to be included in the \"exclude\" section of a service check query                              |
| priority_offset            | 0                | No       | With this you can set higher or lower priority for non prod environments, it affects all the monitors at once |


