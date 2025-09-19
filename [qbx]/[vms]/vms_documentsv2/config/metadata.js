const documentValues = (name, data) => {
    let returnVal = []
    if (name == 'id_card') {
        returnVal.push({
            type: "data",
            label: "First Name:",
            value: data['firstName']
        })

        returnVal.push({
            type: "data",
            label: "Last Name:",
            value: data['lastName']
        })
        
        returnVal.push({
            type: "data",
            label: "Date of Birth:",
            value: data['dateOfBirth']
        })
        
        returnVal.push({
            type: "data",
            label: "SSN:",
            value: data['ssn']
        })

        returnVal.push({
            type: "data",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "ID Card"
        })

    } else if (name == 'driving_license') {
        returnVal.push({
            type: "data",
            label: "First Name:",
            value: data['firstName']
        })

        returnVal.push({
            type: "data",
            label: "Last Name:",
            value: data['lastName']
        })
        
        returnVal.push({
            type: "data",
            label: "Licenses:",
            value: data['drive_a'] + ' ' + data['drive_b'] + ' ' +data['drive_c']
        })
        
        returnVal.push({
            type: "data",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "Driving License"
        })
    } else if (name == 'flying_license') {
        returnVal.push({
            type: "data",
            label: "First Name:",
            value: data['firstName']
        })

        returnVal.push({
            type: "data",
            label: "Last Name:",
            value: data['lastName']
        })
        
        returnVal.push({
            type: "data",
            label: "Licenses:",
            value: data['practical_plane'] + ' ' + data['practical_helicopter']
        })
        
        returnVal.push({
            type: "data",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "Flight License"
        })
    } else if (name == 'boat_license') {
        returnVal.push({
            type: "data",
            label: "First Name:",
            value: data['firstName']
        })

        returnVal.push({
            type: "data",
            label: "Last Name:",
            value: data['lastName']
        })
        
        returnVal.push({
            type: "data",
            label: "License:",
            value: data['practical_boat']
        })
        
        returnVal.push({
            type: "data",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "Boat License"
        })
    } else if (name == 'weapon_license') {
        
    } else if (name == 'police_badge') {
        returnVal.push({
            type: "data",
            label: "Name:",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "data",
            label: "Grade:",
            value: data['jobGrade']
        })

        if (data['badgeNumber']) {
            returnVal.push({
                type: "data2",
                label: "Badge number:",
                value: data['badgeNumber']
            })
        }

        returnVal.push({
            type: "data2",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "Police Badge"
        })
    } else if (name == 'sheriff_badge') {
        returnVal.push({
            type: "data",
            label: "Name:",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "data",
            label: "Grade:",
            value: data['jobGrade']
        })

        if (data['badgeNumber']) {
            returnVal.push({
                type: "data2",
                label: "Badge number:",
                value: data['badgeNumber']
            })
        }

        returnVal.push({
            type: "data2",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "Sheriff Badge"
        })
    } else if (name == 'fib_badge') {
        returnVal.push({
            type: "data",
            label: "Name:",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "data",
            label: "Grade:",
            value: data['jobGrade']
        })

        if (data['badgeNumber']) {
            returnVal.push({
                type: "data2",
                label: "Badge number:",
                value: data['badgeNumber']
            })
        }

        returnVal.push({
            type: "data2",
            label: "Serial Number:",
            value: data['document_id']
        })

        returnVal.push({
            type: "signature",
            value: data['firstName'] + ' ' + data['lastName']
        })

        returnVal.push({
            type: "document_name",
            value: "FIB Badge"
        })
    }

    return returnVal;
}