(require :uiop)

(let* ((desktop-path (merge-pathnames "Desktop/lisp_data/sample/"
                                    (user-homedir-pathname)))
       (datapack-name (car (last (pathname-directory desktop-path))))
       (data-path (merge-pathnames "data/" desktop-path))
       (minecraft-path (merge-pathnames "minecraft/" data-path))
       (tags-path (merge-pathnames "tags/" minecraft-path))
       (function-path (merge-pathnames "function/" tags-path))
       ;;(load-path (merge-pathnames "load.json" function-path))
       ;;(tick-path (merge-pathnames "tick.json" function-path))
       (lzaq-path (merge-pathnames "lzaq/" data-path))
       (client-path (merge-pathnames "client/" data-path))
       (mcmeta-path (merge-pathnames "pack.mcmeta" desktop-path))
       (license-path (merge-pathnames "LICENSE.txt" desktop-path)))

  ;; sampleフォルダの作成
  (ensure-directories-exist desktop-path)
  (format t "sampleフォルダを作成しました: ~a~%" desktop-path)
  
  ;; dataフォルダの作成
  (ensure-directories-exist data-path)
  (format t "dataフォルダを作成しました: ~a~%" data-path)

  ;; minecraftフォルダの作成
  (ensure-directories-exist minecraft-path)
  (format t "minecraftフォルダを作成しました: ~a~%" minecraft-path)

  ;; lzaqフォルダの作成
  (ensure-directories-exist lzaq-path)
  (format t "lzaqフォルダを作成しました: ~a~%" lzaq-path)
  
  ;; clientフォルダの作成
  (ensure-directories-exist client-path)
  (format t "clientフォルダを作成しました: ~a~%" client-path)

  ;; 各フォルダにfunctionフォルダの作成
  (dolist (base-path (list tags-path lzaq-path client-path minecraft-path))
    (let ((function-path (merge-pathnames "function/" base-path)))
      (ensure-directories-exist function-path)
      (format t "functionフォルダを作成しました: ~a~%" function-path)

      ;; function-pathが定義された後で、tick.jsonなどのファイルを作成
      (when (equal base-path tags-path)  ;; tags-pathの場合のみ実行
        ;; tick.jsonの作成
        (let ((tick-path (merge-pathnames "tick.json" function-path)))
          (with-open-file (stream tick-path
                                 :direction :output
                                 :if-exists :supersede
                                 :if-does-not-exist :create)
            (format stream "{~%    \"values\": [~%        ~%    ]~%}"))
          (format t "tick.jsonファイルを作成しました: ~a~%" tick-path))
        
        ;; load.jsonの作成
        (let ((load-path (merge-pathnames "load.json" function-path)))
          (with-open-file (stream load-path
                                 :direction :output
                                 :if-exists :supersede
                                 :if-does-not-exist :create)
            (format stream "{~%    \"values\": [~%        ~%    ]~%}"))
          (format t "load.jsonファイルを作成しました: ~a~%" load-path)))))

  ;; 3つのメインフォルダに各種フォルダを作成
  (dolist (contents-path (list minecraft-path lzaq-path client-path))
    (let* ((advancement-path (merge-pathnames "advancement/" contents-path))
          (item_modifier-path (merge-pathnames "item_modifier/" contents-path))
          (damage_type-path (merge-pathnames "damage_type/" contents-path))
          (loot_table-path (merge-pathnames "loot_table/" contents-path))
          (predicate-path (merge-pathnames "predicate/" contents-path))
          (recipe_path (merge-pathnames "recipe/" contents-path))
          (tag-path (merge-pathnames "tags/" contents-path))
          (texture-path (merge-pathnames "texture/" contents-path))
          (trim_pattern-path (merge-pathnames "trim_pattern/" contents-path))
          (trim_material-path (merge-pathnames "trim_material/" contents-path))
          (world_preset-path (merge-pathnames "world_preset/" contents-path))
          (dimension_type-path (merge-pathnames "dimension_type/" contents-path))
          (dimension-path (merge-pathnames "dimension/" contents-path))
          (worldgens-path (merge-pathnames "worldgen/" contents-path))
          ;;tagsの中身
          (banner_pattern-path (merge-pathnames "banner_pattern/" tag-path))
          (block-path (merge-pathnames "block/" tag-path))
          (cat_variant-path (merge-pathnames "cat_variant/" tag-path))
          (entity_type-path (merge-pathnames "entity_type/" tag-path))
          (fluid-path (merge-pathnames "fluid/" tag-path))
          (function-path (merge-pathnames "function/" tag-path))
          (game_event-path (merge-pathnames "game_event/" tag-path))
          (instrument-path (merge-pathnames "instrument/" tag-path))
          (item-path (merge-pathnames "item/" tag-path))
          (painting_variant-path (merge-pathnames "painting_variant/" tag-path))
          (point_of_interest_type-path (merge-pathnames "point_of_interest_type/" tag-path))
          (worldgen-path (merge-pathnames "worldgen/" tag-path))
          (biome-path (merge-pathnames "biome/" worldgen-path))
          (flat_level_generator_preset-path (merge-pathnames "flat_level_generator_preset/" worldgen-path))
          (structure-path (merge-pathnames "structure/" worldgen-path))
          (world_presets-path (merge-pathnames "world_prest/" worldgen-path))
          ;;worldgenの中身
          (biomes-path (merge-pathnames "biome/" worldgens-path))
          (configured_carver-path (merge-pathnames "configured_carver/" worldgens-path))
          (configured_feature-path (merge-pathnames "configured_feature/" worldgens-path))
          (density_function-path (merge-pathnames "density_function/" worldgens-path))
          (noise-path (merge-pathnames "noise/" worldgens-path))
          (noise_setting-path (merge-pathnames "noise_setting/" worldgens-path))
          (placed_feature-path (merge-pathnames "placed_feature/" worldgens-path))
          (processor_list-path (merge-pathnames "processor_list/" worldgens-path))
          (structures-path (merge-pathnames "structure/" worldgens-path))
          (structure_set-path (merge-pathnames "structure_set/" worldgens-path))
          (template_pool-path (merge-pathnames "template_pool/" worldgens-path))
          (world_presets-path (merge-pathnames "world_preset/" worldgens-path))
          (flat_level_generator_presets-path (merge-pathnames "flat_level_generator_preset/" worldgens-path))
          (multi_noise_biome_source_parameter_list-path (merge-pathnames "multi_noise_biome_source_parameter_list/" worldgens-path))
          )

 ;; フォルダと名前のペアでまとめて処理
      (dolist (entry
               `((,advancement-path "advancement")
                 (,item_modifier-path "item_modifier")
                 (,damage_type-path "damage_type")
                 (,loot_table-path "loot_table")
                 (,predicate-path "predicate")
                 (,recipe_path "recipe")
                 ;;(,tag-path "tag")
                 (,texture-path "texture")
                 (,trim_pattern-path "trim_pattern")
                 (,trim_material-path "trim_material")
                 (,world_preset-path "world_preset")
                 (,dimension_type-path "dimension_type")
                 (,dimension-path "dimension")
                 ;;in tags folder
                 (,banner_pattern-path "banner_pattern")
                 (,block-path "block")
                 (,cat_variant-path "cat_variant")
                 (,entity_type-path "entity_type")
                 (,fluid-path "fluid")
                 (,function-path "function")
                 (,game_event-path "game_event")
                 (,instrument-path "instrument")
                 (,item-path "item")
                 (,painting_variant-path "painting_variant")
                 (,point_of_interest_type-path "point_of_interest_type")
                 (,worldgen-path "worldgen")
                 (,biome-path "biome")
                 (,flat_level_generator_preset-path "flat_level_generator_preset")
                 (,structure-path "structure")
                 (,world_presets-path "world_presets")
                 ;;in worldgen foloder
                 (,biomes-path "biome")
                 (,configured_carver-path "configured_carver")
                 (,configured_feature-path "configured_feature")
                 (,density_function-path "density_function")
                 (,noise-path "noise")
                 (,noise_setting-path "noise_setting")
                 (,placed_feature-path "placed_feature")
                 (,processor_list-path "processor_list")
                 (,structures-path "structure")
                 (,structure_set-path "structure_set")
                 (,template_pool-path "template_pool")
                 (,world_presets-path "world_preset")
                 (,flat_level_generator_presets-path "flat_level_generator_preset")
                 (,multi_noise_biome_source_parameter_list-path "multi_noise_biome_source_parameter_list")
                 ))
        (ensure-directories-exist (first entry))
        (format t "~aフォルダを作成しました: ~a~%" (second entry) (first entry)))))


  ;; pack.mcmetaファイルの作成
  (with-open-file (stream mcmeta-path
                         :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
    (format stream "{
  \"pack\": {
    \"pack_format\": 88,
    \"min_format\": [88.0],
    \"max_format\": 88,
    \"description\": {
      \"text\": \". \",
      \"extra\": [
        {
          \"text\": \"Created By \",
          \"extra\": [
            {
              \"text\": \"LaspberyAqua\",
              \"color\": \"dark_aqua\"
            }
          ]
        }
      ]
    }
  }
}"))
  (format t "pack.mcmetaファイルを作成しました: ~a~%" mcmeta-path)

  ;; LICENSE.txtファイルの作成
  (with-open-file (stream license-path
                         :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
    (format stream "MIT License~%~
~%Copyright (c) 2025 Natsume ~a ~%~
~%Permission is hereby granted, free of charge, to any person obtaining a copy~%~
of this software and associated documentation files (the \"Software\"), to deal~%~
in the Software without restriction, including without limitation the rights~%~
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell~%~
copies of the Software, and to permit persons to whom the Software is~%~
furnished to do so, subject to the following conditions:~%~
~%The above copyright notice and this permission notice shall be included in all~%~
copies or substantial portions of the Software.~%~
~%THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR~%~
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,~%~
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE~%~
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER~%~
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,~%~
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE~%~
SOFTWARE." datapack-name))
  (format t "LICENSE.txtファイルを作成しました: ~a~%" license-path))
