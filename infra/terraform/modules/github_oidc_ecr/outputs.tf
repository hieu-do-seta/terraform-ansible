output "role_arn" {
  description = "ARN of IAM role for GitHub OIDC"
  value       = aws_iam_role.github_actions.arn
}

output "ecr_repo_urls" {
  value = {
    for repo in var.ecr_repositories :
    repo => aws_ecr_repository.this[repo].repository_url
  }
}
