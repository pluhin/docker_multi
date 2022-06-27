pipeline {
    agent  {
		label 'master'
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
                    label 'master'
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
                    label 'master'
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
			label 'master'
		}
		steps {
		sh """
			ls -l /tmp/httpd/	
		"""
		}
	}
    }
}

