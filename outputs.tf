output "eks_cluster_name" {
  description = "EKS cluster name — use with: aws eks update-kubeconfig --name <value>"
  value       = aws_eks_cluster.veritas.name
}

output "aurora_cluster_endpoint" {
  description = "Aurora writer endpoint (private)"
  value       = aws_rds_cluster.trade_ledger.endpoint
  sensitive   = true
}

output "aurora_reader_endpoint" {
  description = "Aurora reader endpoint — use for reporting queries"
  value       = aws_rds_cluster.trade_ledger.reader_endpoint
  sensitive   = true
}

output "aurora_secret_arn" {
  description = "Secrets Manager ARN for Aurora master password"
  value       = aws_rds_cluster.trade_ledger.master_user_secret[0].secret_arn
  sensitive   = true
}

output "redis_primary_endpoint" {
  description = "ElastiCache Redis primary endpoint (private)"
  value       = aws_elasticache_replication_group.ref_data.primary_endpoint_address
  sensitive   = true
}

output "trade_events_queue_url" {
  description = "SQS URL for inbound trade events"
  value       = aws_sqs_queue.trade_events.url
}

output "submission_events_queue_url" {
  description = "SQS URL for outbound regulatory submissions"
  value       = aws_sqs_queue.submission_events.url
}

output "regulatory_archive_bucket" {
  description = "S3 bucket for regulatory submission archive"
  value       = aws_s3_bucket.regulatory_archive.id
}

output "ingestor_role_arn" {
  description = "IRSA role ARN for ingestor pods"
  value       = aws_iam_role.ingestor.arn
}

output "reporter_role_arn" {
  description = "IRSA role ARN for reporter pods"
  value       = aws_iam_role.reporter.arn
}

output "kms_key_arn" {
  description = "Veritas CMK ARN"
  value       = aws_kms_key.veritas.arn
}
