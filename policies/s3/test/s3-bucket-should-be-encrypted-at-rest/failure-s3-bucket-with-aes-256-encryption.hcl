# Copyright IBM Corp. 2025
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-s3-bucket-with-aes-256-encryption/mock-tfconfig-v2.sentinel"
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