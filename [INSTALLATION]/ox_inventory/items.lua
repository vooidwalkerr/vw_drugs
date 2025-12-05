return {
    ["cannabis"] = {
		label = "Cannabis",
		weight = 10,
		client = {
			image = "cannabis.png",
		}
	},
    ["weed"] = {
		label = "Weed",
		weight = 10,
		client = {
			image = "weed.png",
		}
	},
    ['weed_brick'] = {
        label = 'Weed Brick',
        weight = 1000,
        client = {
            image = 'weed_brick.png'
        }
    },
    ['plastic_bag'] = {
        label = 'Plastic Bag',
        weight = 50,  
        type = 'item',
        image = 'plastic_bag.png',
        description = 'An empty plastic bag for storing "items".',
        client = {
            export = 'vw_drugs.packDrugs'
        }
    },
}