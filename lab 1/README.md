# Lab 1 — Declarative First-Boot Configuration with cloud-init

Your task is to write **one file** — `submission/user-data.yaml` — that provisions a
machine to a required state. When you push it, an automated pipeline builds a
throwaway machine from your file and checks the **resulting system state**. There is
no report to write: the machine _is_ your answer.

Work through the lab document first [`Cloud-init Tutorial`](https://docs.cyanlab.org/en/stable/CNIT481-CCI/docs/source/labs/cloud-init.html) on the [CYAN Lab Docs](https://docs.cyanlab.org) site). Everything
you need is in its guided walkthrough.

## What your machine must end up with

**Fixed requirements (same for everyone):**

1. A user **`ciuser`** with:
   - login shell `/bin/bash`,
   - membership in the **`sudo`** group,
   - your **SSH public key** installed,
   - a password that is **not usable for login** (think about cloud-init's default —
     this is not spelled out further on purpose).
2. **`nginx`** installed, and its service **enabled and running**.
3. Provisioning that is **idempotent**: applying your configuration again (after a
   `cloud-init clean`) must not duplicate anything.

**Additional Personalized Requirements (unique to you — see [`params.json`](./params.json)):**

4. An **extra sudo user** (the `extra_sudo_user` value).
5. An **extra package** installed (the `extra_package` value).
6. A **marker file** at the exact `path` from `params.json`, owned by `root:root`,
   mode `0644`, containing the `must_contain` text.

Complete requirements 4–6 using your Purdue username (e.g., if your email id is `pete@purdue.edu`, use `pete` as the `extra_sudo_user`).

## Verify before you submit

Build and verify your `user-data.yaml` it locally (LXD) before your submission and ensure that the `params.json` is updated with the correct values:

```bash
# 1. Schema first — catches most mistakes in a second, without booting anything.
cloud-init schema --config-file submission/user-data.yaml

# 2. Provision a container and wait for cloud-init to complete.
lxc launch ubuntu:26.04 lab1 \
    -c cloud-init.user-data="$(cat submission/user-data.yaml)"
lxc exec lab1 -- cloud-init status --wait

# 3. Spot-check the required state (the grader checks the same kinds of things).
lxc exec lab1 -- id ciuser
lxc exec lab1 -- getent shadow ciuser        # locked password shows ! or *
lxc exec lab1 -- systemctl is-active nginx
lxc exec lab1 -- cat <your marker file path from params.json>

# 4. Prove idempotency: a clean re-run must not duplicate your marker.
lxc exec lab1 -- cloud-init clean --logs
lxc restart lab1
lxc exec lab1 -- cloud-init status --wait

# 5. Clean up.
lxc delete -f lab1
```

## Submission

Rename the folder as `lab1` and upload a `.zip` or `tar.xz` archive to Brightspace.

**IMPORTANT: Do not change the folder or file structure and only update the `user-data.yaml` and the `params.json` files**

## Rubric (100 points)

| #   | Requirement (checked as system state)                 | Points |
| --- | ----------------------------------------------------- | ------ |
| 1.  | `user-data.yaml` valid and cloud-init reaches `done`  | 10     |
| 2.  | `ciuser`: bash, sudo group, SSH key                   | 20     |
| 3.  | `ciuser` password is locked                           | 15     |
| 4.  | `nginx` installed, enabled, active                    | 15     |
| 5.  | Personalised extra user + extra package               | 15     |
| 6.  | Personalised marker file (path, owner, mode, content) | 10     |
| 7.  | Provisioning is idempotent                            | 15     |

## Rules

- Never commit secrets (private keys, real passwords). Use an SSH **public** key.
