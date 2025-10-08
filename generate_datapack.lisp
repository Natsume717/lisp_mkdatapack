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

  ;; tagsフォルダの作成
  (ensure-directories-exist tags-path)
  (format t "tagsフォルダを作成しました: ~a~%" tags-path)

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
          (trim_pattern-path (merge-pathnames "trim_pattern/" contents-path))
          (trim_material-path (merge-pathnames "trim_material/" contents-path))
          (world_preset-path (merge-pathnames "world_preset/" contents-path))
          (dimension_type-path (merge-pathnames "dimension_type/" contents-path))
          (dimension-path (merge-pathnames "dimension/" contents-path))
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
                 (,world_presets-path "world_presets")))
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
    (format stream "~a © 2025 by LaspberryAqua is licensed under CC BY-NC-SA 4.0 ~%
This code is distributed under the CC BY-NC-SA 4.0 License, with the intent to cover software scripts and Minecraft data packs. You are free to adapt, remix, and share under the same license. Commercial use is prohibited." datapack-name))
  (format t "LICENSE.txtファイルを作成しました: ~a~%" license-path))
