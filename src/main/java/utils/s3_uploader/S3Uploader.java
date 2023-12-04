package utils.s3_uploader;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.awscore.exception.AwsServiceException;
import software.amazon.awssdk.core.exception.SdkClientException;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.GetObjectPresignRequest;
import software.amazon.awssdk.services.s3.presigner.model.PresignedGetObjectRequest;

import java.io.IOException;
import java.io.InputStream;
import java.time.Duration;

public class S3Uploader {
    private static final String BUCKET = "news-hch";
    private static final Region REGION = Region.AP_SOUTHEAST_2;

    public static void uploadFile(String fileName, InputStream inputStream) throws S3Exception, AwsServiceException, SdkClientException, IOException {
        S3Client client = S3Client.builder()
                .region(REGION)
                .credentialsProvider(StaticCredentialsProvider.create(AwsBasicCredentials.create("AKIA6GKZUZAHRQILCGV6", "SJvJXIkATESQQAW/QWhEN+UFOe7hlUDc4eRrOGwU")))
                .build();
        PutObjectRequest request = PutObjectRequest.builder()
                .bucket(BUCKET)
                .key(fileName)
                .build();
        client.putObject(request, RequestBody.fromInputStream(inputStream, inputStream.available()));
    }

    public static String generatePresignedUrl(String fileName) {
        S3Presigner presigner = S3Presigner.builder()
                .region(REGION)
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create("AKIA6GKZUZAHRQILCGV6", "SJvJXIkATESQQAW/QWhEN+UFOe7hlUDc4eRrOGwU")))
                .build();

        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket(BUCKET)
                .key(fileName)
                .build();

        GetObjectPresignRequest getObjectPresignRequest = GetObjectPresignRequest.builder()
                .signatureDuration(Duration.ofMinutes(5)) // Set the duration for which the URL is valid
                .getObjectRequest(getObjectRequest)
                .build();

        PresignedGetObjectRequest presignedGetObjectRequest = presigner.presignGetObject(getObjectPresignRequest);

        // Get the path part of the URL
        String path = presignedGetObjectRequest.url().getPath();

        // Build the final URL by appending the path to the S3 bucket URL
        String s3BucketUrl = "https://" + BUCKET + ".s3." + REGION.id() + ".amazonaws.com";
        return s3BucketUrl + path;
    }

}