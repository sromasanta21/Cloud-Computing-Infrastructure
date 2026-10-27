Architecture Overview
=====================

System Overview
---------------
This documentation platform runs using Docker Compose. The Sphinx static site
generator renders RST files into static HTML, which is then served by an Nginx
reverse proxy container.

Network Design
--------------
All service communication is isolated to a custom Docker bridge network.

Live reload verified on Tue Oct 27 01:13:37 PM EDT 2026
