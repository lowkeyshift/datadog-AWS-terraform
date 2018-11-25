# https://www.terraform.io/docs/providers/datadog/index.html

#############################################################################
# Datadog Provider
#############################################################################

# Configure the Datadog provider
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}

#############################################################################
# Monitor
#############################################################################

resource "datadog_monitor" "default" {
    name               = "Linux Foundation New EC2 Monitor"
    type               = "metric alert"
    message            = "Monitor triggered. Notify: @hipchat-channel"
    escalation_message = "Escalation message @pagerduty"

    query = "avg(last_1h):avg:aws.ec2.cpu{region:${var.aws_region}} by {host} > 4"

    thresholds {
      ok                = 0
      warning           = 2
      warning_recovery  = 1
      critical          = 4
      critical_recovery = 3
    }

    notify_no_data    = false
    renotify_interval = 60

    notify_audit = false
    timeout_h    = 60
    include_tags = true

    silenced {
      "*" = 0
    }

    tags = ["region:${var.aws_region}", "foo:bar"]
  }

  #############################################################################
  # Timeboard
  #############################################################################

  resource "datadog_timeboard" "default" {
      title       = "New AWS EC2 Timeboard (created via Terraform)"
      description = "created using the Datadog provider in Terraform"
      read_only   = true

      graph {
        title = "EC2 CPU Utilization by Host"
        viz   = "timeseries"

        request {
          q    = "avg:aws.ec2.cpuutilization{*} by {host}"
          type = "lines"
        }
      }

      graph {
        title = "EC2 Disk R/W Performance"
        viz   = "timeseries"

        request {
          q            = "avg:aws.ec2.disk_read_ops{*} by {host}"
          stacked      = true
        }

        request {
          q            = "avg:aws.ec2.disk_write_ops{*} by {host}"
          style {
            palette = "warm"
          }
        }
      }

      template_variable {
        name   = "host"
        prefix = "host"
      }
  }
