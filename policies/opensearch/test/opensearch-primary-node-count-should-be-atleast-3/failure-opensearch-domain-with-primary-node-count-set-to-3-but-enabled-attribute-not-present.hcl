mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-opensearch-domain-with-primary-node-count-set-to-3-but-enabled-attribute-not-present/mock-tfplan-v2.sentinel"
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