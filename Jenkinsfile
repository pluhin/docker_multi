pipeline {
    agent {
      label 'master'
    }
    stages {
	stage ('Create dir') {
		steps {
		sh """
		   mkdir /tmp/nagios || echo "Dir exists"
		"""
		}
	}
	
        stage('Download') {
	parallel {
            stage('Centos_7') {
            agent {
                dockerfile { 
		    filename 'Cent.7.Dockerfile'
                    label 'master'
		    additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/nagios:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download nagios-plugins-all
                    ls -l /download
                """
            }}
	    stage('Centos_8') {
            agent {
                dockerfile {
                    label 'master'
                    filename 'Cent.8.Dockerfile'
		    additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/nagios:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    cd /download
		    dnf download nagios-plugins-all --resolve
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
			ls -l /tmp/nagios/	
		"""
		}
	}
    }
}

