#!/bin/bash -l

array=( 171 268 452 518 759 946 959 1105 1172 1195 1391 1639 1650 1711 1822 2065 )

params_file=../params_CTL.txt
ramm_file=../source/RAMM_v6.out

for model in "${array[@]}"
do

  cp Parameters_26000.txt ./Parameters_$model.txt
  cp ../steady_states/states_"$model".txt ./
  p=(`awk -v line="$model" 'NR==line' $params_file`)

  sed -i '' 's/ICaL_junc_scl=ICaL_junc_scl/ICaL_junc_scl='"${p[0]}"'/' Parameters_$model.txt
  sed -i '' 's/ICaL_sl_scl=ICaL_sl_scl/ICaL_sl_scl='"${p[0]}"'/' Parameters_$model.txt
  sed -i '' 's/ICaT_junc_scl=ICaT_junc_scl/ICaT_junc_scl='"${p[1]}"'/' Parameters_$model.txt
  sed -i '' 's/ICaT_sl_scl=ICaT_sl_scl/ICaT_sl_scl='"${p[1]}"'/' Parameters_$model.txt
  sed -i '' 's/INaK_junc_scl=INaK_junc_scl/INaK_junc_scl='"${p[2]}"'/' Parameters_$model.txt
  sed -i '' 's/INaK_sl_scl=INaK_sl_scl/INaK_sl_scl='"${p[2]}"'/' Parameters_$model.txt
  sed -i '' 's/INaCa_junc_scl=INaCa_junc_scl/INaCa_junc_scl='"${p[3]}"'/' Parameters_$model.txt
  sed -i '' 's/INaCa_sl_scl=INaCa_sl_scl/INaCa_sl_scl='"${p[3]}"'/' Parameters_$model.txt
  sed -i '' 's/INa_junc_scl=INa_junc_scl/INa_junc_scl='"${p[4]}"'/' Parameters_$model.txt
  sed -i '' 's/INa_sl_scl=INa_sl_scl/INa_sl_scl='"${p[4]}"'/' Parameters_$model.txt
  sed -i '' 's/ITo_scl=ITo_scl/ITo_scl='"${p[5]}"'/' Parameters_$model.txt
  sed -i '' 's/IKr_scl=IKr_scl/IKr_scl='"${p[6]}"'/' Parameters_$model.txt
  sed -i '' 's/IKs_scl=IKs_scl/IKs_scl='"${p[7]}"'/' Parameters_$model.txt
  sed -i '' 's/IK1_scl=IK1_scl/IK1_scl='"${p[8]}"'/' Parameters_$model.txt
  sed -i '' 's/ICaP_junc_scl=ICaP_junc_scl/ICaP_junc_scl='"${p[9]}"'/' Parameters_$model.txt
  sed -i '' 's/ICaP_sl_scl=ICaP_sl_scl/ICaP_sl_scl='"${p[9]}"'/' Parameters_$model.txt
  sed -i '' 's/ICab_junc_scl=ICab_junc_scl/ICab_junc_scl='"${p[10]}"'/' Parameters_$model.txt
  sed -i '' 's/ICab_sl_scl=ICab_sl_scl/ICab_sl_scl='"${p[10]}"'/' Parameters_$model.txt
  sed -i '' 's/INab_junc_scl=INab_junc_scl/INab_junc_scl='"${p[11]}"'/' Parameters_$model.txt
  sed -i '' 's/INab_sl_scl=INab_sl_scl/INab_sl_scl='"${p[11]}"'/' Parameters_$model.txt
  sed -i '' 's/IClb_scl=IClb_scl/IClb_scl='"${p[12]}"'/' Parameters_$model.txt
  sed -i '' 's/X0_File=states.txt/X0_File=states_'"$model"'.txt/' Parameters_$model.txt

  $ramm_file Parameters_$model.txt clamp_$model CELL

done
