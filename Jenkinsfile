pipeline {
    agent  {
		label 'docker'
	}
    stages {
	stage ('Create dir') {
		steps {
		sh """
		   mkdir /tmp/httpd || echo "Dir exists"
		"""
		}
	}
	
        stage('Download') {
	parallel {
            stage('Centos_7') {
            agent {
                dockerfile { 
		    filename 'Cent.7.Dockerfile'
                    label 'docker'
		    //additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/httpd:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download httpd
                    ls -l /download
                """
            }}
	    stage('Centos_8') {
            agent {
                dockerfile {
                    label 'docker'
                    filename 'Cent.8.Dockerfile'
		    //additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/httpd:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download httpd
                    ls -l /download
                """
            }}

        }}
	stage ('Checking') {
		agent {
			label 'docker'
		}
		steps {
		sh """
			ls -l /tmp/httpd/	
		"""
		}
	}
    }
}

