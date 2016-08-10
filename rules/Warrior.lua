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

if not addon.isClass("WARRIOR") then return end

AdiButtonAuras:RegisterRules(function()
	Debug('Adding warrior rules')

	return {
		ImportPlayerSpells { "WARRIOR" },

		Configure {
			"Execute",
			format(L["%s when %s is below %s%% health."], DescribeHighlight("hint"), DescribeAllTokens("enemy"), 20),
			{ 5308, 163201 }, -- Execute
			"enemy",
			{ "UNIT_HEALTH", "UNIT_MAXHEALTH" },
			function(units, model)
				local foe = units.enemy
				local maxHealth = UnitHealthMax(foe)
				if maxHealth <= 0 then return end
				if UnitHealth(foe) / maxHealth <= 0.20 then
					model.hint = true
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
