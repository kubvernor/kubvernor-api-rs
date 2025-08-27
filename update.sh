#!/bin/bash

# ------------------------------------------------------------------------------
# This script will automatically generate API updates for new Gateway API
# releases. Update the $VERSION to the new release version before executing.
#
# This script requires kopium, which can be installed with:
#
#   cargo install kopium
#
# See: https://github.com/kube-rs/kopium
# ------------------------------------------------------------------------------

set -eou pipefail


export APIS_DIR='kubvernor-api/src/'
rm -rf $APIS_DIR/
mkdir -p $APIS_DIR/
kopium --schema=derived --derive=JsonSchema --derive=Default --derive=PartialEq --docs -f resources/kubvernor_crds.yaml > $APIS_DIR/crds.rs

cargo fmt

