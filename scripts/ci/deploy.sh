#!/bin/bash
VERCEL_ORG_ID=$1 VERCEL_PROJECT_ID=$2 vercel deploy --prebuilt --token $3 --prod --yes