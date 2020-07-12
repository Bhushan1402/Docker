pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@18.222.174.49 '
				sudo rm -rf chatApp13/
				'
				scp -r /var/lib/jenkins/workspace/chatApp13 root@52.66.240.187:
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@52.66.240.187 '
				cd chatApp13/
				$(aws ecr get-login --registry-ids 760496128264 --no-include-email --region ap-south-1)
				#docker-compose down 
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi -f chatapp13_chat:latest 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chatapp13_chat
				docker-compose up -d
				#docker stop chatapplication
				#docker rm chatapplication
				#docker build -t chat .
				'
				'''
			}
		}
	post {
		always {
			echo 'Stage is success'
		}
	}
}



