function selectRandomDeck()
    --[[ An alternative mode that allows users to check they like the deck before spawning it ]]
    -- self.UI.setAttribute('deckInput', 'text', '')
    GetRandomDeck(function(deck)
        broadcastToAll("Your random deck is "..deck.name..".\nDeck houses are: "..deck._links.houses[1]..", "..deck._links.houses[2]..", "..deck._links.houses[3]..".", {1, 1, 1})
        GetCardsFromDeckID(deck.id,
            function(card_list)
                local string = 'Deck Name:\n'..deck.name..'\n\nDeck ID: '..deck.id..'\n\nCard List:'
                for _, card in ipairs(card_list) do string = string..'\n'..card.card_title..": "..card.card_number end
                self.UI.setAttribute('deckInput', 'text', string)
                -- if BuildQueued then Wait.frames(BuildFromInput, 1) end
                Wait.frames(BuildFromInput, 1)
            end)
    end)
end

BuildQueued = false

function FetchDeck()
    local url = self.UI.getAttribute('deckURL', 'text')
    if not url or string.len(url) == 0 then return broadcastToAll("Deck URL is empty. Please enter URL of your deck.", {1, 1, 1}) end
    local deckid = url:match("%w+-%w+-%w+-%w+-%w+")
    GetDeckFromID(deckid,
        function(deck)
            broadcastToAll("Your deck is "..deck.name..".\nDeck houses are: "..deck._links.houses[1]..", "..deck._links.houses[2]..", "..deck._links.houses[3]..".", {1, 1, 1})
            GetCardsFromDeckID(deck.id,
                function(card_list)
                    local string = 'Deck Name:\n'..deck.name..'\n\nDeck ID: '..deck.id..'\n\nCard List:'
                    for _, card in ipairs(card_list) do string = string..'\n'..card.card_title..": "..card.card_number end
                    self.UI.setAttribute('deckInput', 'text', string)
                    if BuildQueued then Wait.frames(BuildFromInput, 1) end
            end)
    end)
end

function BuildFromInput()
    local text = self.UI.getAttribute('deckInput', 'text')
    if not text or string.len(text) == 0 then
        BuildQueued = true
        return
    end
    BuildQueued = false
    createKeyForgeDeck(text)
end

function createKeyForgeDeck(string)
    local deck_list = {}
    for line in string:gmatch("[^\r\n,]+") do
        local code = line:match("%s(%d+)$") or line:match("^(%d+)$")
        if code then deck_list[#deck_list + 1] = tonumber(code) end
    end

    local Deck = spawnCustomDeck({
        position = { 0, - 40, 0 },
        scale = { 1.6, 1, 1.6 },
        rotation = { 0, 90, 180 }
        }, deck_list, {
        [1] = "http://cloud-3.steamusercontent.com/ugc/957475029107005592/E0EF335B1DFC847091FA4A3916EB253BCE7E12DF/",
        [19] = "http://cloud-3.steamusercontent.com/ugc/957475029107010147/9C86B450A731C9C56D291F45258400766BDC1A78/",
        [36] = "http://cloud-3.steamusercontent.com/ugc/957475029107011866/B58EF1A1DAED54CE539C49C78599448110B2D871/",
        [53] = "http://cloud-3.steamusercontent.com/ugc/957475029107030372/32CB503C8612AC406FA8B36E2062D7B5E4EFF6B1/",
        [71] = "http://cloud-3.steamusercontent.com/ugc/957475029107033781/C0EF56FFCC2F50E288438626EE75267D9006552D/",
        [89] = "http://cloud-3.steamusercontent.com/ugc/957475029107035798/5721B42E43DA37E21E6B4C01C1B698FB0D5033AB/",
        [107] = "http://cloud-3.steamusercontent.com/ugc/957475029107038907/EC6D25F9BACF0A40559416EB469F2388AE29C6A6/",
        [125] = "http://cloud-3.steamusercontent.com/ugc/957475029107040399/C2148999FF30D7F4E3947E2377F8531B7A84E731/",
        [143] = "http://cloud-3.steamusercontent.com/ugc/957475029107041224/E38003A522C82B6C4D28E5DE8B2FC2F870D9BDF5/",
        [160] = "http://cloud-3.steamusercontent.com/ugc/957475029107043805/62EB4B5AE21172C526BF1614EE96683DBB4681CB/",
        [178] = "http://cloud-3.steamusercontent.com/ugc/957475029107045261/C568375BDB5F5CD15E46B1BF7CA4BFEBD1C152F9/",
        [195] = "http://cloud-3.steamusercontent.com/ugc/957475029107047114/8940E6FC769A8BC77D9561A9B9D14FF566C6D3E4/",
        [212] = "http://cloud-3.steamusercontent.com/ugc/957475029107054496/29A947C2E4CC97DCE74AA38191C50DB0D088F9C7/",
        [231] = "http://cloud-3.steamusercontent.com/ugc/957475029107056004/5D7001FB41B8BC5A2EE4952E19C356B8F269F55F/",
        [249] = "http://cloud-3.steamusercontent.com/ugc/957475029107057537/C7EA08F26A4998FAFD5D646993D8BEC6A3146CBB/",
        [267] = "http://cloud-3.steamusercontent.com/ugc/957475029107060913/3855E94688DC91613E44D1206751716F1FEAF094/",
        [285] = "http://cloud-3.steamusercontent.com/ugc/957475029107063247/8B7F57F730DD9D59F4D8314DEE00E5571CF714CA/",
        [302] = "http://cloud-3.steamusercontent.com/ugc/957475029107064237/8E9964B239417DD806DB84E79AC79428BDBA6A81/",
        [319] = "http://cloud-3.steamusercontent.com/ugc/957475029107073882/04371EBA7B44B1D518245DBD2CDF128CE4D4F096/",
        [337] = "http://cloud-3.steamusercontent.com/ugc/957475029107075772/49D97A934E4BAEE9B8D651A506FA163F456B1BB0/",
        [354] = "http://cloud-3.steamusercontent.com/ugc/957475029107077400/C74658DFE4DA85E89A403E4442830545E97E5C0F/",
        [371] = ""
    }, "http://cloud-3.steamusercontent.com/ugc/957475029107006215/52432501747A5C2BC055B0BD9CFD2E930AEE6E68/",
    {
        "Anger",
        "Barehanded",
        "Blood Money",
        "Brothers in Battle",
        "Burn the Stockpile",
        "Champion's Challenge",
        "Coward's End",
        "Follow the Leader",
        "Lava Ball",
        "Loot the Bodies",
        "Take that, Smartypants",
        "Punch",
        "Relentless Assault",
        "Smith",
        "Sound the Horns",
        "Tremor",
        "Unguarded Camp",
        "Warsong",
        "Autocannon",
        "Banner of Battle",
        "Cannon",
        "Gauntlet of Command",
        "Iron Obelisk",
        "Mighty Javelin",
        "Pile of Skulls",
        "Screechbomb",
        "The Warchest",
        "Bilgum Avalanche",
        "Valdr",
        "Bumpsy",
        "Earthshaker",
        "Firespitter",
        "Ganger Chieftain",
        "Grenade Snib",
        "Headhunter",
        "Hebe the Huge",
        "Kelifi Dragon",
        "King of the Crag",
        "Krump",
        "Lomir Flamefist",
        "Looter Goblin",
        "Mugwump",
        "Pingle Who Annoys",
        "Rock-Hurling Giant",
        "Rogue Ogre",
        "Smaaash",
        "Tireless Crocag",
        "Troll",
        "Wardrummer",
        "Blood of Titans",
        "Phoenix Heart",
        "Yo Mama Mastery",
        "A Fair Game",
        "Arise!",
        "Control the Weak",
        "Creeping Oblivion",
        "Dance of Doom",
        "Fear",
        "Gateway to Dis",
        "Gongoozle",
        "Guilty Hearts",
        "Hand of Dis",
        "Hectacomb",
        "Tendrils of Pain",
        "Hysteria",
        "Key Hammer",
        "Mind Barb",
        "Pandemonium",
        "Poltergeist",
        "Red Hot Armor",
        "Three Fates",
        "Annihilation Ritual",
        "Dominator Bubble",
        "Key to Dis",
        "Lash of Broken Dreams",
        "Library of the Damned",
        "Lifeward",
        "Sacrificial Altar",
        "Screaming Cave",
        "Soul Snatcher",
        "Charette",
        "Drumble",
        "Dust Imp",
        "Eater of the Dead",
        "Ember Imp",
        "Gabos Longarms",
        "Overlord Greking",
        "Guardian Demon",
        "Master of 1",
        "Master of 2",
        "Master of 3",
        "Pit Demon",
        "Pitlord",
        "Restringuntus",
        "Shaffles",
        "Shooler",
        "Snudge",
        "Stealer of Souls",
        "Succubus",
        "Tentacus",
        "The Terror",
        "Tocsin",
        "Tolas",
        "Truebaru",
        "Collar of Subordination",
        "Flame Wreathed",
        "Bouncing Deathquark",
        "Dimension Door",
        "Effervescent Principle",
        "Foggify",
        "Help From Future Self",
        "Interdimensional Graft",
        "Knowledge is Power",
        "Labwork",
        "Library Access",
        "Neuro Syphon",
        "Phase Shift",
        "Positron Bolt",
        "Random Access Archives",
        "Remote Access",
        "Reverse Time",
        "Scrambler Storm",
        "Sloppy Labwork",
        "Twin Bolt Emission",
        "Wild Wormhole",
        "Anomaly Exploiter",
        "Chaos Portal",
        "Crazy Killing Machine",
        "Library of Babble",
        "Mobius Scroll",
        "Pocket Universe",
        "Spangler Box",
        "Spectral Tunneler",
        "Strange Gizmo",
        "The Howling Pit",
        "Batdrone",
        "Brain Eater",
        "Dextre",
        "Doc Bookton",
        "Dr. Escotera",
        "Dysania",
        "Ganymede Archivist",
        "Harland Mindlock",
        "Quixo the «Adventurer»",
        "Mother",
        "Neutron Shark",
        "Novu Archaeologist",
        "Ozmo, Martianologist",
        "Psychic Bug",
        "Replicator",
        "Research Smoko",
        "Skippy Timehog",
        "Timetraveller",
        "Titan Mechanic",
        "Vespilon Theorist",
        "Veylan Analyst",
        "Experimental Therapy",
        "Rocket Boots",
        "Transposition Sandals",
        "Ammonia Clouds",
        "Battle Fleet",
        "Deep Probe",
        "EMP Blast",
        "Hypnotic Command",
        "Irradiated Æmber",
        "Key Abduction",
        "Martian Hounds",
        "Martians Make Bad Allies",
        "Mass Abduction",
        "Mating Season",
        "Mothership Support",
        "Orbital Bombardment",
        "Phosphorus Stars",
        "Psychic Network",
        "Sample Collection",
        "Shatter Storm",
        "Soft Landing",
        "Squawker",
        "Total Recall",
        "Combat Pheromones",
        "Commpod",
        "Crystal Hive",
        "Custom Virus",
        "Feeding Pit",
        "Invasion Portal",
        "Incubation Chamber",
        "Mothergun",
        "Sniffer",
        "Swap Widget",
        "Blypyp",
        "Chuff Ape",
        "Ether Spider",
        "Grabber Jammer",
        "Grommid",
        "«John Smyth»",
        "Mindwarper",
        "Phylyx the Disintegrator",
        "Qyxxlyx Plague Master",
        "Tunk",
        "Ulyq Megamouth",
        "Uxlyx the Zookeeper",
        "Vezyma Thinkdrone",
        "Yxili Maurauder",
        "Yxilo Bolter",
        "Yxilx Dominator",
        "Zorg",
        "Zyzzix the Many",
        "Biomatrix Backup",
        "Brain Stem Antenna",
        "Jammer Pack",
        "Red Planet Ray Gun",
        "Begone!",
        "Blinding Light",
        "Charge!",
        "Cleansing Wave",
        "Clear Mind",
        "Doorstep to Heaven",
        "Glorious Few",
        "Honorable Claim",
        "Inspiration",
        "Mighty Lance",
        "Oath of Poverty",
        "One Stood Against Many",
        "Radiant Truth",
        "Shield of Justice",
        "Take Hostages",
        "Terms of Redress",
        "The Harder They Come",
        "The Spirit's Way",
        "Virtuous Works",
        "Epic Quest",
        "Gorm of Omm",
        "Hallowed Blaster",
        "Potion of Invulnerability",
        "Round Table",
        "Sigil of Brotherhood",
        "Whispering Reliquary",
        "Bulwark",
        "Champion Anaphiel",
        "Champion Tabris",
        "Commander Remiel",
        "Duma the Martyr",
        "Francus",
        "Grey Monk",
        "Hayell the Merchant",
        "Horseman of Death",
        "Horseman of Famine",
        "Horseman of Pestilence",
        "Horseman of War",
        "Jehu the Bureaucrat",
        "Lady Maxena",
        "Lord Golgotha",
        "Numquid the Fair",
        "Protectrix",
        "Raiding Knight",
        "Sanctum Guardian",
        "Sequis",
        "Sergeant Zakiel",
        "Staunch Knight",
        "Gatekeeper",
        "The Vaultkeeper",
        "Veemos Lightbringer",
        "Armageddon Cloak",
        "Mantle of the Zealot",
        "Protect the Weak",
        "Shoulder Armor",
        "Bait and Switch",
        "Booby Trap",
        "Finishing Blow",
        "Ghostly Hand",
        "Hidden Stash",
        "Imperial Traitor",
        "Key of Darkness",
        "Lights Out",
        "Miasma",
        "Nerve Blast",
        "One Last Job",
        "Oubliette",
        "Pawn Sacrifice",
        "Poison Wave",
        "Relentles Whispers",
        "Routine Job",
        "Too Much to Protect",
        "Treasure Map",
        "Customs Office",
        "Evasion Sigil",
        "Longfused Mines",
        "Masterplan",
        "Safe Place",
        "Seeker Needle",
        "Skeleton Key",
        "Special Delivery",
        "Speed Sigil",
        "Subtle Maul",
        "The Sting",
        "Bad Penny",
        "Bulleteye",
        "Carlo Phantom",
        "Deipno Spymaster",
        "Faygin",
        "Macis Asp",
        "Mack the Knife",
        "Magda the Rat",
        "Mooncurser",
        "Nexus",
        "Noddy the Thief",
        "Old Bruno",
        "Dodger",
        "Selwyn the Fence",
        "Shadow Self",
        "Silvertooth",
        "Smiling Ruth",
        "Sneklifter",
        "Umbra",
        "Urchin",
        "Duskrunner",
        "Ring of Invisibility",
        "Silent Dagger",
        "Cooperative Hunting",
        "Curosity",
        "Fertility Chant",
        "Fogbank",
        "Full Moon",
        "Grasping Vines",
        "Key Charge",
        "Lifeweb",
        "Lost in the Woods",
        "Mimicry",
        "Nature's Call",
        "Nocturnal Maneuver",
        "Perilous Wild",
        "Regrowth",
        "Save the Pack",
        "Scout",
        "Stampede",
        "The Common Cold",
        "Troop Call",
        "Vigor",
        "Word of Returning",
        "Bear Flute",
        "Nepenthe Seed",
        "Ritual of Balance",
        "Ritual of the Hunt",
        "World Tree",
        "Ancient Bear",
        "Bigtwig",
        "Witch of the Wilds",
        "Briar Grubbling",
        "Chota Hazri",
        "Dew Faerie",
        "Dust Pixie",
        "Flaxia",
        "Fuzzy Gruen",
        "Giant Sloth",
        "Halacor",
        "Inka the Spider",
        "Kindrith Longshot",
        "Snufflegator",
        "Lupo the Scarred",
        "Mighty Tiger",
        "Murmook",
        "Mushroom Man",
        "Niffle Ape",
        "Niffle Queen",
        "Piranha Monkeys",
        "Teliga",
        "Hunting Witch",
        "Witch of the Eye",
        "Way of the Bear",
        "Way of the Wolf"
    })

    Wait.frames(function() animatedPlaceDeck(Deck, { - 45.07, 3, 5.90 }) end, 1)
end

function InputFieldtextPolyfill(_, value, id) self.UI.setAttribute(id, 'text', value) end

--- Create a new deck from a list of card indexes and face urls.
-- @param object The table to be used for spawnObjectJSON. json property will be overriden.
-- @param cards The list of card IDs, relative to FaceURLs
-- @param FaceURLs A table of FaceURLs to be used in the deck - keyed by the card ID of the first face in the image
-- @param BackURL Image to use for the back of the cards
-- @param names A list of names to be used in alignment with FaceURLs, if the string keyed by a card id is non-null it will be used for the card name
-- @return A reference to the created object
function spawnCustomDeck(object, cards, FaceURLs, BackURL, names)
    if #cards < 2 then error("Deck must contian at least 2 cards") end

    local CardURLs = {}
    for _, id in ipairs(cards) do
        local FaceURL = nil
        for startId, URL in pairs(FaceURLs) do
            if startId > id then break end
            FaceURL = {startId, URL}
        end
        if string.len(FaceURL[2]) == 0 then error("Card "..id.." does not exist") end
        CardURLs[#CardURLs + 1] = {
            subCard = id - FaceURL[1],
            URL = FaceURL[2],
            Name = names[id]
        }
    end

    local Deck = {
        Name = "Deck",
        DeckIDs = {},
        Transform = { scaleX = 1, scaleY = 1, scaleZ = 1 },
        BackIsHidden = true,
        CustomDeck = {},
        ContainedObjects = {}
    }
    for _, Card in ipairs(CardURLs) do
        local SubDeckID = nil
        for id, subDeck in pairs(Deck.CustomDeck) do
            if Card.URL == subDeck.FaceURL then
                SubDeckID = id
                break
            end
        end
        if not SubDeckID then
            local CustomDeckLength = 0
            for _ in pairs(Deck.CustomDeck) do CustomDeckLength = CustomDeckLength + 1 end
            SubDeckID = tostring(CustomDeckLength + 1)
            Deck.CustomDeck[SubDeckID] = { NumHeight = 4, NumWidth = 5, BackIsHidden = true, BackURL = BackURL, FaceURL = Card.URL }
        end
        local CardObj = {
            Name = "Card",
            Transform = {scaleX = 1, scaleY = 1, scaleZ = 1}
        }
        if Card.Name then CardObj.Nickname = Card.Name end
        Deck.ContainedObjects[#Deck.ContainedObjects + 1] = CardObj
        Deck.DeckIDs[#Deck.DeckIDs + 1] = (tonumber(SubDeckID) * 100) + Card.subCard
    end

    object.json = JSON.encode(Deck)
    return spawnObjectJSON(object)
end
function animatedPlaceDeck(deck, position, index)
    local index = index
    if not index then index = #deck.getObjects() - 1 end

    if index < 0 then return deck.destruct() end

    local forward = deck.getTransformForward()
    local tmp = deck.clone()
    tmp.setPosition({
        position[1] + forward[1] * - 3,
        position[2] + 0.5,
        position[3] + forward[3] * - 3
    })
    tmp.takeObject({ position = position, index = index })
    tmp.destruct()
    Wait.frames(function() animatedPlaceDeck(deck, position, index - 1) end, 1)
end

function GetCardsFromDeckID(deck_id, callback)
    keyForgeAPI("/decks/"..deck_id.."/?links=cards,notes",
        function(error, data)
            if error then return print('Request for '..deck_id..' failed:\n'..error) end
            local cards = {}
            for k, v in ipairs(data._linked.cards) do cards[v.id] = v end
            local card_list = {}
            for _, v in ipairs(data.data._links.cards) do
                if cards[v].is_maverick == true then
                    broadcastToAll(cards[v].card_title .. ' is Maverick of '.. cards[v].house..'!', {1, 0, 0})
                    print("Use Decal on that card to mark it.")
                end
                card_list[#card_list + 1] = cards[v] end
                callback(card_list)
        end)
    end
    function GetDeckFromID(id, callback)
        keyForgeAPI("/decks/"..id,
            function(error, data)
                if error then return print("Error fetching deck "..id..": ".. data) end
                callback(data.data)
        end)
    end
    function GetRandomDeck(callback)
        keyForgeAPI('/decks/',
            function(error, data)
                if error then return print("Error fetching random deck: ".. data) end
                keyForgeAPI('/decks/?page='..(math.floor(math.random() * data.count / 10)),
                    function(error, data)
                        if error then return print("Error fetching random deck: ".. data) end
                        local decks = data.data
                        local deck = decks[math.floor(math.random() * #decks)]
                        if not deck then return GetRandomDeck(callback) end
                        callback(deck)
                end)
        end)
    end
    function keyForgeAPI(route, callback)
        WebRequest.get('https://www.keyforgegame.com/api'..route,
            function(webReturn)
                if webReturn.is_error then return callback(true, webReturn.error) end
                if string.len(webReturn.text) == 0 then return callback(true, "Empty response") end
                local success, data = pcall(function() return JSON.decode(webReturn.text) end)
                if not success then return callback(true, data) end
                if data.message then return callback(true, data) end
                callback(false, data)
        end)
    end
