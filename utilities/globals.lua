ABN.mult_to_chips = {
	mult = "chips",
	h_mult = "h_chips",
	mult_mod = "chip_mod",
	x_mult = "x_chips",
	Xmult = "xchips",
	xmult = "xchips",
	x_mult_mod = "Xchip_mod",
	Xmult_mod = "Xchip_mod",
	eq_mult = "eq_chips",
	Eqmult_mod = "Eqchips_mod",
	xlog_mult = "xlog_chips",
	e_mult = "e_chips",
	emult = "echips",
	Emult_mod = "Echip_mod",
	ee_mult = "ee_chips",
	eemult = "eechips",
	EEmult_mod = "EEchip_mod",
}
ABN.chips_to_mult = {}
for k, v in pairs(ABN.mult_to_chips) do
	ABN.chips_to_mult[v] = k
end
