--#region Nabbed multibox tech from MoreFluff (very cool mod), check them out! (https://github.com/notmario/MoreFluff)

function ABN.parse_string(text)
  for i, v in pairs(text) do
    if type(v) == "table" then
      ABN.parse_string(v)
    else
      text[i] = loc_parse_string(v)
    end
  end
end

function ABN.create_vtext(vtext, AUT, nodes, vars, lines, num)
  local localize_args = {
    AUT = AUT,
    nodes = nodes,

    vars = vars
  }
  -- taken from localize; adds the multibox
  localize_args.AUT.multi_box = localize_args.AUT.multi_box or {}
  local i = num + 1 -- fucking janky ass method
  G.AUT = AUT
  for j, line in ipairs(lines) do
    local final_line = SMODS.localize_box(line, localize_args)
    if i == 1 or next(AUT.info) then
      nodes[#nodes + 1] = final_line -- Sends main box to AUT.main
      if not next(AUT.info) then nodes.main_box_flag = true end
    elseif not next(AUT.info) then
      nodes.main_box_flag = true
      AUT.multi_box[i - 1] = AUT.multi_box[i - 1] or {}
      AUT.multi_box[i - 1][#AUT.multi_box[i - 1] + 1] = final_line
    end
    if not next(AUT.info) and vars.box_colours then
      AUT.box_colours[i] = vars.box_colours and vars.box_colours[i] or
          G.C.UI.BACKGROUND_WHITE
    end
  end
end

function ABN.generate_ui_multiboxes(args2)
  return function(center, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    -- if not full_UI_table.box_colours then return end
    local num = full_UI_table.multi_box and #full_UI_table.multi_box + 1 or 1
    for i, args in pairs(args2) do
      if not args.func or args:func(card) then
        local keys = type(args.key) == "table" and args.key or { args.key }
        for _, k in pairs(keys) do
          local vars = args.loc_vars and (args:loc_vars({}, card) or {}).vars or {}
          local lines = SMODS.shallow_copy(G.localization.misc.v_dictionary_parsed[k] or {})
          local vtext = localize { type = "variable", key = k, vars = vars } -- the var doesn't matter here
          ABN.create_vtext(vtext, full_UI_table, desc_nodes, vars, lines, num)
          if args.seperate_boxes then
            num = num + 1
          end
        end
        local texts = type(args.localized_text) == "table" and args.localized_text or { args.localized_text }
        for _, k in pairs(texts) do
          local vars = args.loc_vars and (args:loc_vars({}, card) or {}).vars or {}
          local vtext = type(k) == "string" and { k } or k or {}
          ABN.parse_string(vtext)
          ABN.create_vtext(nil, full_UI_table, desc_nodes, vars, vtext, num)
          if args.seperate_boxes then
            num = num + 1
          end
        end
        if not args.seperate_boxes then
          num = num + 1
        end
      end
    end
  end
end

--#endregion

function ABN.add_extra_multiboxes(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table, ability, ...)
  if G.jokers and _c.set == "Joker" then
    local joker_bonuses = {
      "abn_perma_bonus",
      "abn_perma_mult",
      "abn_perma_xmult",
      "abn_perma_xchips",
      "abn_perma_dollars",
      "abn_perma_rep",
    }

    local text = {}
    for _, perma_bonus in ipairs(joker_bonuses) do
      if ability[perma_bonus] and ability[perma_bonus] > 0 then
        text[#text + 1] = G.localization.misc.dictionary[perma_bonus]
      end
    end

    if #text > 0 then
      ABN.generate_ui_multiboxes({
        {
          localized_text = text,
          loc_vars = function(self, card, center)
            return {
              vars = {
                ability.abn_perma_bonus or 0,
                ability.abn_perma_mult or 0,
                ability.abn_perma_xmult or 0,
                ability.abn_perma_xchips or 0,
                ability.abn_perma_dollars or 0,
                ability.abn_perma_rep or 0
              }
            }
          end
        }
      })(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end
  end
end
