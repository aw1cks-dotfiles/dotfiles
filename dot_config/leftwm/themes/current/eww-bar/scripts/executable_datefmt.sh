#!/bin/sh

case "$(date '+%d')" in
  *'1') SUFFIX='ˢᵗ' ;;
  *'2') SUFFIX='ⁿᵈ' ;;
  *'3') SUFFIX='ʳᵈ' ;;
  *)    SUFFIX='ᵗʰ' ;;
esac

date "+%-I:%M:%S %#p     %a, %-d${SUFFIX} %b %Y   "
