Document Thumbnails as a Service
--------------------------------

### Background

Many startups allow users to upload documents of varying formats to their platforms (XLS, PDF, CAD, DOC). Although the ingestion of binary data is straightforward, the generation of accurate thumbnails and fast-loading/browse-able previews is technically challenging and typically falls outside the focus-area of the startup.

### Challenge

Create a service for generating high-quality thumbnails and preview-images for the most popular file formats. Through API instrumentation the system needs to dynamically scale up to 100's  of concurrent requests (and down to 1s) with reasonable latency while minimizing waste.

### Further Ideas

Thumbnails could be animated GIFs, scrolling through a document.
