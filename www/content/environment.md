---
# This section is the front matter.  It is optional but if present must be a
# YAML object.  The key/values defined here are used by the layouts when
# rendering this content.

# optional: The URL for the environment's or organisation's logo.
logo_url: images/png_trans_logo.png

# optional: The name of the environment.
#name: Demo Cluster

# optional: The name of the organisation that the environment belongs to.
#organisation_name: Demo organisation

# optional: A list of contacts for this environment.
#contacts:
# - name: A Contact
#   email: a.contact@example.com
# - name: A Nother Contact
#   email: a.nother.contact@example.com

# optional: A list of links for this environment.
links:
 - text: Documentation
   tooltip: OpenflightHPC documentation
   href: https://openflighthpc.org/docs/
   external: true
 #- text: An external link
 #  href: http://example.com
 #  external: true
 #- text: An internal link
 #  href: /some/path
 #  external: false

---

<!-- This is markdown.  The content is rendered and displayed prominently on
the landing page.  -->

This environment is powered by OpenflightHPC Compute and the Flight User
Suite.  It can do many things

## What is OpenFlightHPC Compute?

OpenFlight Compute is the software environment designed to help researchers
and scientists run their own high-performance compute research environment
quickly and easily. The basic structure provided for users is as follows:

 - One gateway node, plus a configurable number of compute nodes
 - An Enterprise Linux operating system
 - A shared filesystem, mounted across all nodes
 - A batch job scheduler
 - Access to various libraries of software applications

<div class="clearfix">
  <button
    class="btn btn-primary learn-more float-right"
    href="https://use.openflighthpc.org/en/latest/overview/whatisit.html"
  >
  Learn more
  </button>
</div>

## What is Flight User Suite?

The Flight User Suite is a collection of environment tools that provide users
with easy and intuitive ways to manage the software and desktop sessions in a
research envrionment. The purpose of these tools is to get researchers started
with HPC as quickly as possible without needing to worry about their
environment, leaving them to do what they do best - research!

<div class="clearfix">
  <button
    class="btn btn-primary learn-more float-right"
    href="https://use.openflighthpc.org/en/latest/installing-user-suite/install.html"
  >
  Learn more
  </button>
</div>
