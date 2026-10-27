#!/bin/sh
# Usage: sh src/check.sh <format-dir>  — prints check findings compactly
cd "$(dirname "$0")/../$1" && npx --yes hyperframes@0.8.191 check --json 2>&1 | node -e "let s='';process.stdin.on('data',d=>s+=d).on('end',()=>{const j=JSON.parse(s.slice(s.indexOf('{')));console.log('$1 ok',j.ok);for(const k of Object.keys(j)){const v=j[k];if(v&&v.findings&&v.findings.length)for(const f of v.findings.slice(0,25))console.log(' ',k,f.severity||f.level,f.rule||f.code,'|',(f.message||'').slice(0,260),f.selector||f.elementId||'',f.time!=null?('@'+f.time):'')}})"
