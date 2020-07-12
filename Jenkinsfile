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
				cd newChatapp/
				#docker-compose down 
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi -f pipelinechatapp_chatapp:latest bhushan1402/chatapp
				docker rmi -f pipelinechatapp_db:latest bhushan1402/chatappdb
				docker rmi -f pipelinechatapp_nginx:latest bhushan1402/chatappnginx
				docker-compose up -d
				#docker stop chatapplication
				#docker rm chatapplication
				#docker build -t chat .
				'
				'''
			}
		}
		stage('Push Image') {
			steps { 
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@52.66.240.187 '
				docker tag pipelinechatapp_chatapp bhushan1402/chatapp
				docker push bhushan1402/chatapp
				#docker tag chat:latest 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chat
				#docker push 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chat
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



