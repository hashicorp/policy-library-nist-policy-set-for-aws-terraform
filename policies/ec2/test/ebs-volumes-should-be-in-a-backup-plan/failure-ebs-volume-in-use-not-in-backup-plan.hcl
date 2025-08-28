mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-ebs-volume-in-use-not-in-backup-plan/mock-tfconfig-v2.sentinel"
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