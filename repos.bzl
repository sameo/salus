# SPDX-FileCopyrightText: Copyright (c) 2023 by Rivos Inc.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@salus-index//:defs.bzl", cr_index = "crate_repositories")
load("@salus-default//:defs.bzl", cr_default = "crate_repositories")
load("@salus-nodefault//:defs.bzl", cr_nodefault = "crate_repositories")
load("@salus-once//:defs.bzl", cr_once = "crate_repositories")
load("@salus-rwlock//:defs.bzl", cr_rwlock = "crate_repositories")
load("@rice-index//:defs.bzl", cr_rice = "crate_repositories")
load("@sbi-index//:defs.bzl", cr_sbi = "crate_repositories")

def salus_repositories():
    cr_index()
    cr_default()
    cr_nodefault()
    cr_once()
    cr_rwlock()
    cr_rice()
    cr_sbi()
