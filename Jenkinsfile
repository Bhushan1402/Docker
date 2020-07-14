pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@18.217.180.181 '
				sudo rm -rf pipelinechatapp/
				'
				scp -r /var/lib/jenkins/workspace/pipelinechatapp root@18.217.180.181:
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@18.217.180.181 '
				cd pipelinechatapp/
				#docker-compose down 
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi -f pipelinechatapp_chatapp:latest 
				docker-compose up -d
				'
				'''
			}
		}
		
	}
	post {
		always {
			echo 'Stage is success'
		}
	}
}



