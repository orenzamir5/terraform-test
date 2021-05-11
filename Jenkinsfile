  pipeline {
    agent {
      node {
        label "master"
      } 
    }

    stages {

//      stage('fetch_latest_code') {
//        steps {
//          git credentialsId: 'github', url: 'https://github.com/orenzamir5/terraform-test.git'
//        }
//      }

      stage('fetch_latest_code') {
        steps {
          sh 'cd terraform-test && git checkout . && git pull'
        }
      }

      stage('TF Init&Plan') {
        steps {
          sh "cd terraform-test/${TERRAFORM_PROJECT} && terraform init && terraform plan"
        }      
      }

      stage('Approval') {
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
      }

      stage('TF Apply') {
        steps {
          sh "cd terraform-test/${TERRAFORM_PROJECT} && terraform apply -input=false"
        }
      }
    } 
  }
