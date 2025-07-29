# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-s3-bucket-public-access-block-not-complaint/mock-tfplan-v2.sentinel"
	}
}



mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-s3-bucket-public-access-block-not-complaint/mock-tfstate-v2.sentinel"
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

test {
	rules = {
		main = false
	}
}