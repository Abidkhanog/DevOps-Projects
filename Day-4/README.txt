Project 4: Automated S3 Data Archival – Use S3 lifecycle rules to move data to Glacier.
🔴 Mandatory Instructions for Students
Before starting ANY task, students MUST:
Open AWS Pricing Calculator

Estimate the cost for the AWS services.

Understand which resources are billable

Introduction

Amazon S3 (Simple Storage Service) provides lifecycle policies that allow automatic data archival and deletion. This project sets up an automated process where data stored in an S3 bucket is automatically moved to Amazon S3 Glacier for cost-effective long-term storage.
Steps to Implement
Step 1: Create an S3 Bucket
Sign in to the AWS Management Console.
Navigate to Amazon S3 → Create bucket.
Provide a unique bucket name (e.g., my-archival-bucket).
Choose a region and configure other settings as needed.
Click Create bucket. Step 2: Upload Sample Data
Open the created S3 bucket.
Click Upload, select some files, and confirm the upload.
Step 3: Create an S3 Lifecycle Rule
In the S3 bucket, go to the Management tab.
Click Create lifecycle rule.
Enter a rule name (e.g., move-to-glacier).
Choose Apply to all objects in the bucket or select a specific prefix.
Under Lifecycle rule actions, select Move current versions of objects between storage classes.
Configure the transition:
Move to Glacier Instant Retrieval after X days (e.g., 30 days).
Move to Glacier Deep Archive after Y days (e.g., 90 days) for further cost optimization.
Click Create rule.
Step 4: Verify the Lifecycle Rule
Wait for the configured time period (or adjust settings to test quickly).

Check object storage class changes in the Objects tab (should show Glacier
after transition).
Step 5: Restore Archived Data (Optional)
Select an object stored in Glacier.
Click Initiate restore → Choose retrieval option (e.g., Standard, Expedited, or Bulk).
Set the duration for temporary access and confirm the restore request.
Conclusion
This project automates data archival using S3 lifecycle rules, reducing storage costs by moving older data to Amazon Glacier while keeping it retrievable when needed.


