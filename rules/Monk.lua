--[[
AdiButtonAuras - Display auras on action buttons.
Copyright 2013-2016 Adirelle (adirelle@gmail.com)
All rights reserved.

This file is part of AdiButtonAuras.

AdiButtonAuras is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

AdiButtonAuras is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with AdiButtonAuras.  If not, see <http://www.gnu.org/licenses/>.
--]]

local _, addon = ...

if not addon.isClass("MONK") then return end

AdiButtonAuras:RegisterRules(function()
	Debug('Adding monk rules')

	return {
		ImportPlayerSpells { "MONK" },

		Configure {
			"InvokePets",
			L["Show the duration of @NAME."],
			{
				123904, -- Invoke Xuen, the White Tiger
				132578, -- Invoke Niuzao, the Black Ox
				198664, -- Invoke Chi-Ji, the Red Crane
			},
			"player",
			"UNIT_PET",
			function(_, model)
				local remaining = GetPetTimeRemaining()
				if remaining then
					model.expiration = GetTime() + remaining / 1000
					model.highlight = "good"
				end
			end,
		},
	}
end)

-- ABA
-- GLOBALS: AddRuleFor BuffAliases BuildAuraHandler_FirstOf BuildAuraHandler_Longest
-- GLOBALS: BuildAuraHandler_Single BuildDesc BuildKey Configure DebuffAliases Debug
-- GLOBALS: DescribeAllSpells DescribeAllTokens DescribeFilter DescribeHighlight
-- GLOBALS: DescribeLPSSource GetBuff GetDebuff GetLib GetPlayerBuff GetPlayerDebuff
-- GLOBALS: ImportPlayerSpells IterateBuffs IterateDebuffs IteratePlayerBuffs
-- GLOBALS: IteratePlayerDebuffs L LongestDebuffOf PassiveModifier PetBuffs PLAYER_CLASS
-- GLOBALS: SelfBuffAliases SelfBuffs SharedSimpleBuffs SharedSimpleDebuffs ShowPower
-- GLOBALS: ShowStacks SimpleBuffs SimpleDebuffs

-- WoW API
-- GLOBALS: GetNumGroupMembers GetPetTimeRemaining GetRuneCooldown GetShapeshiftFormID
-- GLOBALS: GetSpellCharges GetSpellBonusHealing GetSpellInfo GetTime GetTotemInfo
-- GLOBALS: HasPetSpells IsPlayerSpell UnitCanAttack UnitCastingInfo UnitChannelInfo
-- GLOBALS: UnitClass UnitHealth UnitHealthMax UnitIsDeadOrGhost UnitIsPlayer UnitName
-- GLOBALS: UnitPower UnitPowerMax UnitStagger

-- Lua API
-- GLOBALS: bit ceil floor format ipairs math min pairs print select string table
-- GLOBALS: tinsert type
