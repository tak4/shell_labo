#!/bin/bash

sed -E 's/^(\[[^]]*\]|<[^>]*>)[[:space:]]*//' sample.log