# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/failure-for-rds-cluster/mock-tfplan-v2.sentinel"
  }
}

mock "tfresources" {
  module {
    source = "../../../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
  module {
    source = "../../../../modules/mocks/report/report.sentinel"
  }
}

param "resource_type" {
  value = "aws_rds_cluster"
}

test {
  rules = {
    main = false
  }
}