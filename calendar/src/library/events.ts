interface Events {
    id: string
    status: string;
    htmlLink: string;
    created: Date;
    updated: Date;
    summary: string;
    description: string;
    colorId: string;
}

interface Organizer {
    id: string;
    email: string;
    displayName: string;
    self: boolean;
}

interface start {
    date: Date;
    timezone: string;
}


interface end {
    date: Date;
    timezone: string;
}

interface attendees {
      id: string
      emai: string,
      displayName: string
      organizer: boolean
      self: boolean
      resource: boolean
      optional: boolean
      responseStatus:string
      comment: string
      additionalGuests: number
      attendeesOmitted: boolean
    }

