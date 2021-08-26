# oci-arch-adw-oac

This repository stores 5 examples demonstrating how to provision the infrastructure needed for Autonomous Data Warehouse and Oracle Analytics Cloud

## How this project is organized

The terraform code for each example is stored in a separate folder.

The folders are organized as follows:

- [adw-oac](adw-oac): launch an Autonomous Data Warehouse instance and an instance of Oracle Analytics Cloud.
- [adw-odi-oac](adw-odi-oac): launch an Autonomous Data Warehouse instance, a compute instance with Oracle Data Integrator image from the Oracle Cloud Infrastructure marketplace and an instance of Oracle Analytics Cloud.
- [adw-odi-enrich-data](adw-odi-enrich-data): launch an Autonomous Data Warehouse instance, a compute instance with Oracle Data Integrator image from the Oracle Cloud Infrastructure marketplace, Stream Pool, Stream, Data Catalog, a Data Science Project and an instance of Oracle Analytics Cloud.
- [adw-odi-data-lake](adw-odi-data-lake): launch an Autonomous Data Warehouse instance, a compute instance with Oracle Data Integrator image from the Oracle Cloud Infrastructure marketplace, a compute instance with Oracle GoldenGate image from the Oracle Cloud Infrastructure marketplace, a compute instance with Oracle GoldenGate Stream Analytics image from the Oracle Cloud Infrastructure marketplace, Stream Pool, Stream, Data Catalog, a Data Science Project, a Data Flow application and an instance of Oracle Analytics Cloud.
- [adw-odi-data-science](adw-odi-data-science): launch a compute instance with Oracle Data Integrator image from the Oracle Cloud Infrastructure marketplace, Stream Pool, Stream, Data Integration Workspace, a Data Science Project and a Data Flow application.
- [streaming-data-science](streaming-data-science) This architecture uses OCI Streaming for ingesting continuous, high-volume streams of data into object storage through an integration made with Oracle's Service Connector Hub.