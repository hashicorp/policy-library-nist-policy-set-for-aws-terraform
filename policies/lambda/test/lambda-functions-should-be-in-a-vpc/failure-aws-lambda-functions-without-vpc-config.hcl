mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-aws-lambda-functions-without-vpc-config/mock-tfconfig-v2.sentinel"
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