#!/bin/sh

agens -v cwd="$(pwd)/csvs/" -f sql/import.sql postgres
