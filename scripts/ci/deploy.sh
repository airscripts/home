#!/bin/bash
vercel pull --yes --environment=production --token $3
vercel build --environment=production --token $3
VERCEL_ORG_ID=$1 VERCEL_PROJECT_ID=$2 vercel deploy --prebuilt --token $3 --prod --yes