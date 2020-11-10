pipeline {
    agent {
      label 'master'
    }
    stages {
        stage('Download') {
	parallel {
            stage('Centos_7') {
            agent {
                dockerfile { 
		    filename 'Cent.7.Dockerfile'
                    label 'master'
		    additionalBuildArgs '--network=host'
                    args '-u root -v /tmp:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download nagios-plugins-all
                    ls -l /download
                """
            }}
	    stage('Centos_6') {
            agent {
                dockerfile {
                    label 'master'
                    filename 'Cent.6.Dockerfile'
		    additionalBuildArgs '--network=host'
                    args '-u root -v /tmp:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download nagios-plugins-all
                    ls -l /download
                """
            }}

        }}
	stage ('Checking') {
		agent {
			label 'master'
		}
		steps {
		sh """
			ls -l /tmp/nagios*	
		"""
		}
	}
    }
}

