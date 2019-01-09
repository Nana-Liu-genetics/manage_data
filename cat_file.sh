#!/usr/bin/env bash
awk 'NR==1{print}' ../weights/0000_nested_cv_chr10_weights.txt >> weight_head
for j in {1..22}
 do
  for i in {0000..1800}
  do
   if test -f ../weights/$i\_nested_cv_chr$j\_weights.txt
  then
   cat ../weights/$i\_nested_cv_chr$j\_weights.txt >> ../weights/nested_cv_chr$j\_weights.txt
  fi
 done
 sed -i '/gene_id/d' ../weights/nested_cv_chr$j\_weights.txt
 cat weight_head ../weights/nested_cv_chr$j\_weights.txt >> ../weights/hippo_nested_cv_chr$j\_weights.txt
 rm ../weights/nested_cv_chr$j\_weights.txt
done
