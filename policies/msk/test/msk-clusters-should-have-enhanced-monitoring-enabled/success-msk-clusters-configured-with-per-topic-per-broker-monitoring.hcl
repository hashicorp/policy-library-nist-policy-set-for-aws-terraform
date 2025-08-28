mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-msk-clusters-configured-with-per-topic-per-broker-monitoring/mock-tfplan-v2.sentinel"
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
		main = true
	}
}