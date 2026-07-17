G.FUNCS.customize_deck_page = function(args)
  if not args or not args.cycle_config then return end

  local page = args.cycle_config.current_option or 1
  local t = create_UIBox_customize_deck(page)

  if G.OVERLAY_MENU then G.OVERLAY_MENU:remove() end
  G.OVERLAY_MENU = UIBox {
    definition = t,
    config = {
      align = 'cm',
      offset = { x = 0, y = 0 },
      parent = G.OVERLAY_MENU
    }
  }
end

-- Overrides original Customize Deck page ui to add pages so the ui doesnt leak
function create_UIBox_customize_deck(page)
  page = page or 1

  local suitTabs = {}

  local index = 1
  for i, suit in ipairs(SMODS.Suit:obj_list(true)) do
    if G.COLLABS.options[suit.key] then
      suitTabs[index] = {
        label = localize(suit.key, 'suits_plural'),
        tab_definition_function = G.UIDEF.custom_deck_tab,
        tab_definition_function_args = suit.key
      }
      index = index + 1
    end
  end

  --#region page stuff
  local tabs_per_page = 4
  local total_pages = math.ceil(#suitTabs / tabs_per_page)

  local page_start = (page - 1) * tabs_per_page + 1
  local page_end = math.min(page_start + tabs_per_page - 1, #suitTabs)

  local suitsPage = {}
  for i = page_start, page_end do
    table.insert(suitsPage, suitTabs[i])
  end

  local page_options = {}
  for i = 1, total_pages do
    table.insert(page_options, localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(total_pages))
  end
  --#endregion

  if suitsPage[1] then
    suitsPage[1].chosen = true
  end

  local t = create_UIBox_generic_options({
    back_func = 'options',
    snap_back = nil,
    contents = {
      {
        n = G.UIT.R,
        config = { align = 'cm', padding = 0 },
        nodes = {
          create_tabs({
            tabs = suitsPage,
            snap_to_nav = true,
            no_shoulders = true
          })
        }
      },
      total_pages > 1 and {
        n = G.UIT.R,
        config = { align = 'cm', padding = 0 },
        nodes = {
          create_option_cycle({
            options = page_options,
            w = 4.5,
            cycle_shoulders = true,
            opt_callback = 'customize_deck_page',
            current_option = page,
            colour = G.C.RED,
            no_pips = true
          })
        }
      } or nil
    }
  })

  return t
end
