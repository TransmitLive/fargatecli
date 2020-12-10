import * as cdk from '@aws-cdk/core';
import * as ecr from '@aws-cdk/aws-ecr';

export class CdkStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new ecr.Repository(this, 'Repo', {
      repositoryName: 'fargatecli',
      removalPolicy: cdk.RemovalPolicy.DESTROY
    });

  }
}
