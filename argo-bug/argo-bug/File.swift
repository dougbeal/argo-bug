//
//  File.swift
//  argo-bug
//
//  Created by Douglas Beal on 12/8/15.
//  Copyright © 2015 Douglas Beal. All rights reserved.
//


import Argo
import Curry

public typealias Field =  String

public func CombineFields( fields: [Field] ) -> String {
    var strings = [String]()
    for (index, value) in fields.enumerate() {
        strings[index] = "\(value)"
    }
    return strings.joinWithSeparator(",")
}

// MARK: res generatetype
struct PlaylistItemsService {
}
struct PlaylistsService {
}
struct ThumbnailsService {
}
// MARK: schema code
// writeSchemaCode

// writeSchemaStruct

struct ActivityContentDetailsPlaylistItem {
    // playlistId: The value that YouTube uses to uniquely identify the
    // playlist.
    let playlistId: String //  json:"playlistId,omitempty"
    
    // playlistItemId: ID of the item within the playlist.
    let playlistItemId: String //  json:"playlistItemId,omitempty"
    
    // resourceId: The resourceId object contains information about the
    // resource that was added to the playlist.
    let resourceId: ResourceId? //  json:"resourceId,omitempty"
}
extension ActivityContentDetailsPlaylistItem: Decodable {
    static func decode (j: JSON) -> Decoded<ActivityContentDetailsPlaylistItem> {
        let part0 = curry(ActivityContentDetailsPlaylistItem.init)
            <^> j <| "playlistId" // string
            <*> j <| "playlistItemId" // string
            <*> j <|? "resourceId" //Reference //
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PageInfo {
    // resultsPerPage: The number of results included in the API response.
    let resultsPerPage: Int64 //  json:"resultsPerPage,omitempty"
    
    // totalResults: The total number of results in the result set.
    let totalResults: Int64 //  json:"totalResults,omitempty"
}
extension PageInfo: Decodable {
    static func decode (j: JSON) -> Decoded<PageInfo> {
        let part0 = curry(PageInfo.init)
            <^> j <| "resultsPerPage" // integer
            <*> j <| "totalResults" // integer
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Playlist {
    // contentDetails: The contentDetails object contains information like
    // video count.
    let contentDetails: PlaylistContentDetails? //  json:"contentDetails,omitempty"
    
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty"
    
    // id: The ID that YouTube uses to uniquely identify the playlist.
    let id: String //  json:"id,omitempty"
    
    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlist".
    let kind: String //  json:"kind,omitempty"
    
    // localizations: Localizations for different languages
    let localizations: [String: PlaylistLocalization] //  json:"localizations,omitempty"
    
    // player: The player object contains information that you would use to
    // play the playlist in an embedded player.
    let player: PlaylistPlayer? //  json:"player,omitempty"
    
    // snippet: The snippet object contains basic details about the
    // playlist, such as its title and description.
    let snippet: PlaylistSnippet? //  json:"snippet,omitempty"
    
    // status: The status object contains status information for the
    // playlist.
    let status: PlaylistStatus? //  json:"status,omitempty"
}
extension Playlist: Decodable {
    static func decode (j: JSON) -> Decoded<Playlist> {
        let part0 = curry(Playlist.init)
            <^> j <|? "contentDetails" //Reference //
            <*> j <| "etag" // string
            <*> j <| "id" // string
        
        let part3 = part0
            <*> j <| "kind" // string
        let part4 = part3
            <*> (j <| "localizations" >>- decodeObject)
        //<*> (j <| "localizations" >>- Dictionary<String,PlaylistLocalization>.decode )
        
        // object
        let part5 = part4
            <*> j <|? "player" //Reference //
            <*> j <|? "snippet" //Reference //
        let part7 = part5
            <*> j <|? "status" //Reference //
        return part7
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistContentDetails {
    // itemCount: The number of videos in the playlist.
    let itemCount: Int64 //  json:"itemCount,omitempty"
}
extension PlaylistContentDetails: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistContentDetails> {
        let part0 = curry(PlaylistContentDetails.init)
            <^> j <| "itemCount" // integer
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItem {
    // contentDetails: The contentDetails object is included in the resource
    // if the included item is a YouTube video. The object contains
    // additional information about the video.
    let contentDetails: PlaylistItemContentDetails? //  json:"contentDetails,omitempty"
    
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty"
    
    // id: The ID that YouTube uses to uniquely identify the playlist item.
    let id: String //  json:"id,omitempty"
    
    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlistItem".
    let kind: String //  json:"kind,omitempty"
    
    // snippet: The snippet object contains basic details about the playlist
    // item, such as its title and position in the playlist.
    let snippet: PlaylistItemSnippet? //  json:"snippet,omitempty"
    
    // status: The status object contains information about the playlist
    // item's privacy status.
    let status: PlaylistItemStatus? //  json:"status,omitempty"
}
extension PlaylistItem: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistItem> {
        let part0 = curry(PlaylistItem.init)
            <^> j <|? "contentDetails" //Reference //
            <*> j <| "etag" // string
            <*> j <| "id" // string
        let part3 = part0
            <*> j <| "kind" // string
            <*> j <|? "snippet" //Reference //
            <*> j <|? "status" //Reference //
        return part3
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemContentDetails {
    // endAt: The time, measured in seconds from the start of the video,
    // when the video should stop playing. (The playlist owner can specify
    // the times when the video should start and stop playing when the video
    // is played in the context of the playlist.) By default, assume that
    // the video.endTime is the end of the video.
    let endAt: String //  json:"endAt,omitempty"
    
    // note: A user-generated note for this item.
    let note: String //  json:"note,omitempty"
    
    // startAt: The time, measured in seconds from the start of the video,
    // when the video should start playing. (The playlist owner can specify
    // the times when the video should start and stop playing when the video
    // is played in the context of the playlist.) The default value is 0.
    let startAt: String //  json:"startAt,omitempty"
    
    // videoId: The ID that YouTube uses to uniquely identify a video. To
    // retrieve the video resource, set the id query parameter to this value
    // in your API request.
    let videoId: String //  json:"videoId,omitempty"
}
extension PlaylistItemContentDetails: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistItemContentDetails> {
        let part0 = curry(PlaylistItemContentDetails.init)
            <^> j <| "endAt" // string
            <*> j <| "note" // string
            <*> j <| "startAt" // string
        let part3 = part0
            <*> j <| "videoId" // string
        return part3
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty"
    
    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty"
    
    // items: A list of playlist items that match the request criteria.
    let items: [PlaylistItem] //  json:"items,omitempty"
    
    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlistItemListResponse".
    let kind: String //  json:"kind,omitempty"
    
    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty"
    
    let pageInfo: PageInfo? //  json:"pageInfo,omitempty"
    
    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty"
    
    let tokenPagination: String? //  json:"tokenPagination,omitempty"
    
    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty"
}
extension PlaylistItemListResponse: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistItemListResponse> {
        let part0 = curry(PlaylistItemListResponse.init)
            <^> j <| "etag" // string
            <*> j <| "eventId" // string
            <*> j <|| "items" //ArrayType // array
        let part3 = part0
            <*> j <| "kind" // string
            <*> j <| "nextPageToken" // string
            <*> j <|? "pageInfo" //Reference //
            <*> j <| "prevPageToken" // string
        let part7 = part3
            <*> j <|? "tokenPagination" //Reference //
            <*> j <| "visitorId" // string
        return part7
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemSnippet {
    // channelId: The ID that YouTube uses to uniquely identify the user
    // that added the item to the playlist.
    let channelId: String //  json:"channelId,omitempty"
    
    // channelTitle: Channel title for the channel that the playlist item
    // belongs to.
    let channelTitle: String //  json:"channelTitle,omitempty"
    
    // description: The item's description.
    let description: String //  json:"description,omitempty"
    
    // playlistId: The ID that YouTube uses to uniquely identify the
    // playlist that the playlist item is in.
    let playlistId: String //  json:"playlistId,omitempty"
    
    // position: The order in which the item appears in the playlist. The
    // value uses a zero-based index, so the first item has a position of 0,
    // the second item has a position of 1, and so forth.
    let position: Int64 //  json:"position,omitempty"
    
    // publishedAt: The date and time that the item was added to the
    // playlist. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ)
    // format.
    let publishedAt: String //  json:"publishedAt,omitempty"
    
    // resourceId: The id object contains information that can be used to
    // uniquely identify the resource that is included in the playlist as
    // the playlist item.
    let resourceId: ResourceId? //  json:"resourceId,omitempty"
    
    // thumbnails: A map of thumbnail images associated with the playlist
    // item. For each object in the map, the key is the name of the
    // thumbnail image, and the value is an object that contains other
    // information about the thumbnail.
    let thumbnails: ThumbnailDetails? //  json:"thumbnails,omitempty"
    
    // title: The item's title.
    let title: String //  json:"title,omitempty"
}
extension PlaylistItemSnippet: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistItemSnippet> {
        let part0 = curry(PlaylistItemSnippet.init)
            <^> j <| "channelId" // string
            <*> j <| "channelTitle" // string
            <*> j <| "description" // string
        let part3 = part0
            <*> j <| "playlistId" // string
            <*> j <| "position" // integer
            <*> j <| "publishedAt" // string
            <*> j <|? "resourceId" //Reference //
        let part7 = part3
            <*> j <|? "thumbnails" //Reference //
            <*> j <| "title" // string
        return part7
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemStatus {
    // privacyStatus: This resource's privacy status.
    let privacyStatus: String //  json:"privacyStatus,omitempty"
}
extension PlaylistItemStatus: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistItemStatus> {
        let part0 = curry(PlaylistItemStatus.init)
            <^> j <| "privacyStatus" // string
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty"
    
    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty"
    
    // items: A list of playlists that match the request criteria.
    let items: [Playlist] //  json:"items,omitempty"
    
    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlistListResponse".
    let kind: String //  json:"kind,omitempty"
    
    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty"
    
    let pageInfo: PageInfo? //  json:"pageInfo,omitempty"
    
    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty"
    
    
    
    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty"
}
extension PlaylistListResponse: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistListResponse> {
        let part0 = curry(PlaylistListResponse.init)
            <^> j <| "etag" // string
            <*> j <| "eventId" // string
            <*> j <|| "items" //ArrayType // array
        let part3 = part0
            <*> j <| "kind" // string
            <*> j <| "nextPageToken" // string
            <*> j <|? "pageInfo" //Reference //
            <*> j <| "prevPageToken" // string
        let part7 = part3
            
            <*> j <| "visitorId" // string
        return part7
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistLocalization {
    // description: The localized strings for playlist's description.
    let description: String //  json:"description,omitempty"
    
    // title: The localized strings for playlist's title.
    let title: String //  json:"title,omitempty"
}
extension PlaylistLocalization: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistLocalization> {
        let part0 = curry(PlaylistLocalization.init)
            <^> j <| "description" // string
            <*> j <| "title" // string
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistPlayer {
    // embedHtml: An <iframe> tag that embeds a player that will play the
    // playlist.
    let embedHtml: String //  json:"embedHtml,omitempty"
}
extension PlaylistPlayer: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistPlayer> {
        let part0 = curry(PlaylistPlayer.init)
            <^> j <| "embedHtml" // string
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistSnippet {
    // channelId: The ID that YouTube uses to uniquely identify the channel
    // that published the playlist.
    let channelId: String //  json:"channelId,omitempty"
    
    // channelTitle: The channel title of the channel that the video belongs
    // to.
    let channelTitle: String //  json:"channelTitle,omitempty"
    
    // defaultLanguage: The language of the playlist's default title and
    // description.
    let defaultLanguage: String //  json:"defaultLanguage,omitempty"
    
    // description: The playlist's description.
    let description: String //  json:"description,omitempty"
    
    // localized: Localized title and description, read-only.
    let localized: PlaylistLocalization? //  json:"localized,omitempty"
    
    // publishedAt: The date and time that the playlist was created. The
    // value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty"
    
    // tags: Keyword tags associated with the playlist.
    let tags: [String] //  json:"tags,omitempty"
    
    // thumbnails: A map of thumbnail images associated with the playlist.
    // For each object in the map, the key is the name of the thumbnail
    // image, and the value is an object that contains other information
    // about the thumbnail.
    let thumbnails: ThumbnailDetails? //  json:"thumbnails,omitempty"
    
    // title: The playlist's title.
    let title: String //  json:"title,omitempty"
}
extension PlaylistSnippet: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistSnippet> {
        let part0 = curry(PlaylistSnippet.init)
            <^> j <| "channelId" // string
            <*> j <| "channelTitle" // string
            <*> j <| "defaultLanguage" // string
        let part3 = part0
            <*> j <| "description" // string
            <*> j <|? "localized" //Reference //
            <*> j <| "publishedAt" // string
            <*> j <|| "tags" //ArrayType // array
        let part7 = part3
            <*> j <|? "thumbnails" //Reference //
            <*> j <| "title" // string
        return part7
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistStatus {
    // privacyStatus: The playlist's privacy status.
    let privacyStatus: String //  json:"privacyStatus,omitempty"
}
extension PlaylistStatus: Decodable {
    static func decode (j: JSON) -> Decoded<PlaylistStatus> {
        let part0 = curry(PlaylistStatus.init)
            <^> j <| "privacyStatus" // string
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ResourceId {
    // channelId: The ID that YouTube uses to uniquely identify the referred
    // resource, if that resource is a channel. This property is only
    // present if the resourceId.kind value is youtube#channel.
    let channelId: String //  json:"channelId,omitempty"
    
    // kind: The type of the API resource.
    let kind: String //  json:"kind,omitempty"
    
    // playlistId: The ID that YouTube uses to uniquely identify the
    // referred resource, if that resource is a playlist. This property is
    // only present if the resourceId.kind value is youtube#playlist.
    let playlistId: String //  json:"playlistId,omitempty"
    
    // videoId: The ID that YouTube uses to uniquely identify the referred
    // resource, if that resource is a video. This property is only present
    // if the resourceId.kind value is youtube#video.
    let videoId: String //  json:"videoId,omitempty"
}
extension ResourceId: Decodable {
    static func decode (j: JSON) -> Decoded<ResourceId> {
        let part0 = curry(ResourceId.init)
            <^> j <| "channelId" // string
            <*> j <| "kind" // string
            <*> j <| "playlistId" // string
        let part3 = part0
            <*> j <| "videoId" // string
        return part3
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Thumbnail {
    // height: (Optional) Height of the thumbnail image.
    let height: Int64 //  json:"height,omitempty"
    
    // url: The thumbnail image's URL.
    let url: String //  json:"url,omitempty"
    
    // width: (Optional) Width of the thumbnail image.
    let width: Int64 //  json:"width,omitempty"
}
extension Thumbnail: Decodable {
    static func decode (j: JSON) -> Decoded<Thumbnail> {
        let part0 = curry(Thumbnail.init)
            <^> j <| "height" // integer
            <*> j <| "url" // string
            <*> j <| "width" // integer
        return part0
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ThumbnailDetails {
    // default_: The default image for this resource.
    let default_: Thumbnail? //  json:"default,omitempty"
    
    // high: The high quality image for this resource.
    let high: Thumbnail? //  json:"high,omitempty"
    
    // maxres: The maximum resolution quality image for this resource.
    let maxres: Thumbnail? //  json:"maxres,omitempty"
    
    // medium: The medium quality image for this resource.
    let medium: Thumbnail? //  json:"medium,omitempty"
    
    // standard: The standard quality image for this resource.
    let standard: Thumbnail? //  json:"standard,omitempty"
}
extension ThumbnailDetails: Decodable {
    static func decode (j: JSON) -> Decoded<ThumbnailDetails> {
        let part0 = curry(ThumbnailDetails.init)
            <^> j <|? "default" //Reference //
            <*> j <|? "high" //Reference //
            <*> j <|? "maxres" //Reference //
        let part3 = part0
            <*> j <|? "medium" //Reference //
            <*> j <|? "standard" //Reference //
        return part3
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ThumbnailSetResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty"
    
    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty"
    
    // items: A list of thumbnails.
    let items: [ThumbnailDetails] //  json:"items,omitempty"
    
    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#thumbnailSetResponse".
    let kind: String //  json:"kind,omitempty"
    
    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty"
}
extension ThumbnailSetResponse: Decodable {
    static func decode (j: JSON) -> Decoded<ThumbnailSetResponse> {
        let part0 = curry(ThumbnailSetResponse.init)
            <^> j <| "etag" // string
            <*> j <| "eventId" // string
            <*> j <|| "items" //ArrayType // array
        let part3 = part0
            <*> j <| "kind" // string
            <*> j <| "visitorId" // string
        return part3
    }
}
// writeSchemaCode

// writeSchemaStruct

struct TokenPagination {
}// MARK: meth code
// MARK: res methods


// method id "youtube.playlistItems.delete":
// meth generateCode
// // ...Call struct

struct PlaylistItemsDeleteCall {
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a playlist item.
// // ...Service extension
extension PlaylistItemsService {
    func delete(id: String) -> PlaylistItemsDeleteCall {
        let c = PlaylistItemsDeleteCall(
            
            opt_: Dictionary<String, String>(),
            id: id
        )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsDeleteCall {
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistItemsDeleteCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Deletes a playlist item.",
    //   "httpMethod": "DELETE",
    //   "id": "youtube.playlistItems.delete",
    //   "parameterOrder": [
    //     "id"
    //   ],
    //   "parameters": {
    //     "id": {
    //       "description": "The id parameter specifies the YouTube playlist item ID for the playlist item that is being deleted. In a playlistItem resource, the id property specifies the playlist item's ID.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlistItems",
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.playlistItems.insert":
// meth generateCode
// // ...Call struct

struct PlaylistItemsInsertCall {
    var opt_: [String: String]
    var part: String
    var playlistitem: PlaylistItem
}

// insert: Adds a resource to a playlist.
// // ...Service extension
extension PlaylistItemsService {
    func insert(part: String, playlistitem: PlaylistItem) -> PlaylistItemsInsertCall {
        let c = PlaylistItemsInsertCall(
            
            opt_: Dictionary<String, String>(),
            part: part,
            playlistitem: playlistitem
        )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsInsertCall {
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistItemsInsertCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistItemsInsertCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Adds a resource to a playlist.",
    //   "httpMethod": "POST",
    //   "id": "youtube.playlistItems.insert",
    //   "parameterOrder": [
    //     "part"
    //   ],
    //   "parameters": {
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "part": {
    //       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlistItems",
    //   "request": {
    //     "$ref": "PlaylistItem"
    //   },
    //   "response": {
    //     "$ref": "PlaylistItem"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.playlistItems.list":
// meth generateCode
// // ...Call struct

struct PlaylistItemsListCall {
    var opt_: [String: String]
    var part: String
}

// list: Returns a collection of playlist items that match the API
// request parameters. You can retrieve all of the playlist items in a
// specified playlist or retrieve one or more playlist items by their
// unique IDs.
// // ...Service extension
extension PlaylistItemsService {
    func list(part: String) -> PlaylistItemsListCall {
        let c = PlaylistItemsListCall(
            
            opt_: Dictionary<String, String>(),
            part: part
        )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsListCall {
    
    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of one or more unique playlist item IDs.
    mutating func id(id: String) -> PlaylistItemsListCall {
        self.opt_["id"] = "\(id)"
        return self
    }
    
    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    mutating func maxResults(maxResults: Int64) -> PlaylistItemsListCall {
        self.opt_["maxResults"] = "\(maxResults)"
        return self
    }
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistItemsListCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    
    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    mutating func pageToken(pageToken: String) -> PlaylistItemsListCall {
        self.opt_["pageToken"] = "\(pageToken)"
        return self
    }
    
    // playlistId sets the optional parameter "playlistId": The playlistId
    // parameter specifies the unique ID of the playlist for which you want
    // to retrieve playlist items. Note that even though this is an optional
    // parameter, every request to retrieve playlist items must specify a
    // value for either the id parameter or the playlistId parameter.
    mutating func playlistId(playlistId: String) -> PlaylistItemsListCall {
        self.opt_["playlistId"] = "\(playlistId)"
        return self
    }
    
    // videoId sets the optional parameter "videoId": The videoId parameter
    // specifies that the request should return only the playlist items that
    // contain the specified video.
    mutating func videoId(videoId: String) -> PlaylistItemsListCall {
        self.opt_["videoId"] = "\(videoId)"
        return self
    }
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistItemsListCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Returns a collection of playlist items that match the API request parameters. You can retrieve all of the playlist items in a specified playlist or retrieve one or more playlist items by their unique IDs.",
    //   "httpMethod": "GET",
    //   "id": "youtube.playlistItems.list",
    //   "parameterOrder": [
    //     "part"
    //   ],
    //   "parameters": {
    //     "id": {
    //       "description": "The id parameter specifies a comma-separated list of one or more unique playlist item IDs.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "maxResults": {
    //       "default": "5",
    //       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
    //       "format": "uint32",
    //       "location": "query",
    //       "maximum": "50",
    //       "minimum": "0",
    //       "type": "integer"
    //     },
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "pageToken": {
    //       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "part": {
    //       "description": "The part parameter specifies a comma-separated list of one or more playlistItem resource properties that the API response will include.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a playlistItem resource, the snippet property contains numerous fields, including the title, description, position, and resourceId properties. As such, if you set part=snippet, the API response will contain all of those properties.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     },
    //     "playlistId": {
    //       "description": "The playlistId parameter specifies the unique ID of the playlist for which you want to retrieve playlist items. Note that even though this is an optional parameter, every request to retrieve playlist items must specify a value for either the id parameter or the playlistId parameter.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "videoId": {
    //       "description": "The videoId parameter specifies that the request should return only the playlist items that contain the specified video.",
    //       "location": "query",
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlistItems",
    //   "response": {
    //     "$ref": "PlaylistItemListResponse"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtube.readonly",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ],
    //   "supportsSubscription": true
    // }
    
}

// method id "youtube.playlistItems.update":
// meth generateCode
// // ...Call struct

struct PlaylistItemsUpdateCall {
    var opt_: [String: String]
    var part: String
    var playlistitem: PlaylistItem
}

// update: Modifies a playlist item. For example, you could update the
// item's position in the playlist.
// // ...Service extension
extension PlaylistItemsService {
    func update(part: String, playlistitem: PlaylistItem) -> PlaylistItemsUpdateCall {
        let c = PlaylistItemsUpdateCall(
            
            opt_: Dictionary<String, String>(),
            part: part,
            playlistitem: playlistitem
        )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsUpdateCall {
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistItemsUpdateCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Modifies a playlist item. For example, you could update the item's position in the playlist.",
    //   "httpMethod": "PUT",
    //   "id": "youtube.playlistItems.update",
    //   "parameterOrder": [
    //     "part"
    //   ],
    //   "parameters": {
    //     "part": {
    //       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. For example, a playlist item can specify a start time and end time, which identify the times portion of the video that should play when users watch the video in the playlist. If your request is updating a playlist item that sets these values, and the request's part parameter value includes the contentDetails part, the playlist item's start and end times will be updated to whatever value the request body specifies. If the request body does not specify values, the existing start and end times will be removed and replaced with the default settings.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlistItems",
    //   "request": {
    //     "$ref": "PlaylistItem"
    //   },
    //   "response": {
    //     "$ref": "PlaylistItem"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.playlists.delete":
// meth generateCode
// // ...Call struct

struct PlaylistsDeleteCall {
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a playlist.
// // ...Service extension
extension PlaylistsService {
    func delete(id: String) -> PlaylistsDeleteCall {
        let c = PlaylistsDeleteCall(
            
            opt_: Dictionary<String, String>(),
            id: id
        )
        return c
    }
}

// // ...Call extension
extension PlaylistsDeleteCall {
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsDeleteCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistsDeleteCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }

    // {
    //   "description": "Deletes a playlist.",
    //   "httpMethod": "DELETE",
    //   "id": "youtube.playlists.delete",
    //   "parameterOrder": [
    //     "id"
    //   ],
    //   "parameters": {
    //     "id": {
    //       "description": "The id parameter specifies the YouTube playlist ID for the playlist that is being deleted. In a playlist resource, the id property specifies the playlist's ID.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     },
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlists",
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.playlists.insert":
// meth generateCode
// // ...Call struct

struct PlaylistsInsertCall {
    var opt_: [String: String]
    var part: String
    var playlist: Playlist
}

// insert: Creates a playlist.
// // ...Service extension
extension PlaylistsService {
    func insert(part: String, playlist: Playlist) -> PlaylistsInsertCall {
        let c = PlaylistsInsertCall(
            
            opt_: Dictionary<String, String>(),
            part: part,
            playlist: playlist
        )
        return c
    }
}

// // ...Call extension
extension PlaylistsInsertCall {
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsInsertCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    
    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    //
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    mutating func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> PlaylistsInsertCall {
        self.opt_["onBehalfOfContentOwnerChannel"] = "\(onBehalfOfContentOwnerChannel)"
        return self
    }
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistsInsertCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Creates a playlist.",
    //   "httpMethod": "POST",
    //   "id": "youtube.playlists.insert",
    //   "parameterOrder": [
    //     "part"
    //   ],
    //   "parameters": {
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "onBehalfOfContentOwnerChannel": {
    //       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "part": {
    //       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlists",
    //   "request": {
    //     "$ref": "Playlist"
    //   },
    //   "response": {
    //     "$ref": "Playlist"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.playlists.list":
// meth generateCode
// // ...Call struct

struct PlaylistsListCall {
    var opt_: [String: String]
    var part: String
}

// list: Returns a collection of playlists that match the API request
// parameters. For example, you can retrieve all playlists that the
// authenticated user owns, or you can retrieve one or more playlists by
// their unique IDs.
// // ...Service extension
extension PlaylistsService {
    func list(part: String) -> PlaylistsListCall {
        let c = PlaylistsListCall(
            
            opt_: Dictionary<String, String>(),
            part: part
        )
        return c
    }
}

// // ...Call extension
extension PlaylistsListCall {
    
    // channelId sets the optional parameter "channelId": This value
    // indicates that the API should only return the specified channel's
    // playlists.
    mutating func channelId(channelId: String) -> PlaylistsListCall {
        self.opt_["channelId"] = "\(channelId)"
        return self
    }
    
    // hl sets the optional parameter "hl": The hl parameter should be used
    // for filter out the properties that are not in the given language.
    // Used for the snippet part.
    mutating func hl(hl: String) -> PlaylistsListCall {
        self.opt_["hl"] = "\(hl)"
        return self
    }
    
    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube playlist ID(s) for the
    // resource(s) that are being retrieved. In a playlist resource, the id
    // property specifies the playlist's YouTube playlist ID.
    mutating func id(id: String) -> PlaylistsListCall {
        self.opt_["id"] = "\(id)"
        return self
    }
    
    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    mutating func maxResults(maxResults: Int64) -> PlaylistsListCall {
        self.opt_["maxResults"] = "\(maxResults)"
        return self
    }
    
    // mine sets the optional parameter "mine": Set this parameter's value
    // to true to instruct the API to only return playlists owned by the
    // authenticated user.
    mutating func mine(mine: Bool) -> PlaylistsListCall {
        self.opt_["mine"] = "\(mine)"
        return self
    }
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsListCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    
    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    //
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    mutating func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> PlaylistsListCall {
        self.opt_["onBehalfOfContentOwnerChannel"] = "\(onBehalfOfContentOwnerChannel)"
        return self
    }
    
    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    mutating func pageToken(pageToken: String) -> PlaylistsListCall {
        self.opt_["pageToken"] = "\(pageToken)"
        return self
    }
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistsListCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Returns a collection of playlists that match the API request parameters. For example, you can retrieve all playlists that the authenticated user owns, or you can retrieve one or more playlists by their unique IDs.",
    //   "httpMethod": "GET",
    //   "id": "youtube.playlists.list",
    //   "parameterOrder": [
    //     "part"
    //   ],
    //   "parameters": {
    //     "channelId": {
    //       "description": "This value indicates that the API should only return the specified channel's playlists.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "hl": {
    //       "description": "The hl parameter should be used for filter out the properties that are not in the given language. Used for the snippet part.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "id": {
    //       "description": "The id parameter specifies a comma-separated list of the YouTube playlist ID(s) for the resource(s) that are being retrieved. In a playlist resource, the id property specifies the playlist's YouTube playlist ID.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "maxResults": {
    //       "default": "5",
    //       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
    //       "format": "uint32",
    //       "location": "query",
    //       "maximum": "50",
    //       "minimum": "0",
    //       "type": "integer"
    //     },
    //     "mine": {
    //       "description": "Set this parameter's value to true to instruct the API to only return playlists owned by the authenticated user.",
    //       "location": "query",
    //       "type": "boolean"
    //     },
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "onBehalfOfContentOwnerChannel": {
    //       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "pageToken": {
    //       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "part": {
    //       "description": "The part parameter specifies a comma-separated list of one or more playlist resource properties that the API response will include.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a playlist resource, the snippet property contains properties like author, title, description, tags, and timeCreated. As such, if you set part=snippet, the API response will contain all of those properties.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlists",
    //   "response": {
    //     "$ref": "PlaylistListResponse"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtube.readonly",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.playlists.update":
// meth generateCode
// // ...Call struct

struct PlaylistsUpdateCall {
    var opt_: [String: String]
    var part: String
    var playlist: Playlist
}

// update: Modifies a playlist. For example, you could change a
// playlist's title, description, or privacy status.
// // ...Service extension
extension PlaylistsService {
    func update(part: String, playlist: Playlist) -> PlaylistsUpdateCall {
        let c = PlaylistsUpdateCall(
            
            opt_: Dictionary<String, String>(),
            part: part,
            playlist: playlist
        )
        return c
    }
}

// // ...Call extension
extension PlaylistsUpdateCall {
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsUpdateCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> PlaylistsUpdateCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Modifies a playlist. For example, you could change a playlist's title, description, or privacy status.",
    //   "httpMethod": "PUT",
    //   "id": "youtube.playlists.update",
    //   "parameterOrder": [
    //     "part"
    //   ],
    //   "parameters": {
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "part": {
    //       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nNote that this method will override the existing values for mutable properties that are contained in any parts that the request body specifies. For example, a playlist's description is contained in the snippet part, which must be included in the request body. If the request does not specify a value for the snippet.description property, the playlist's existing description will be deleted.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "playlists",
    //   "request": {
    //     "$ref": "Playlist"
    //   },
    //   "response": {
    //     "$ref": "Playlist"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ]
    // }
    
}

// method id "youtube.thumbnails.set":
// meth generateCode
// // ...Call struct

struct ThumbnailsSetCall {
    var opt_: [String: String]
    var videoId: String
    /* TODO: upload support
    media_     io.Reader
    resumable_ googleapi.SizeReaderAt
    mediaType_ string
    ctx_       context.Context
    protocol_  string
    TODO: upload support */
}

// set: Uploads a custom video thumbnail to YouTube and sets it for a
// video.
// // ...Service extension
extension ThumbnailsService {
    func set(videoId: String) -> ThumbnailsSetCall {
        let c = ThumbnailsSetCall(
            
            opt_: Dictionary<String, String>(),
            videoId: videoId
        )
        return c
    }
}

// // ...Call extension
extension ThumbnailsSetCall {
    
    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    //
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // actual CMS account that the user authenticates with must be linked to
    // the specified YouTube content owner.
    mutating func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ThumbnailsSetCall {
        self.opt_["onBehalfOfContentOwner"] = "\(onBehalfOfContentOwner)"
        return self
    }
    //TODO: convert media upload
    
    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    mutating func fields(fields: Field...) -> ThumbnailsSetCall {
        self.opt_["fields"] = CombineFields(fields)
        return self
    }
    

    // {
    //   "description": "Uploads a custom video thumbnail to YouTube and sets it for a video.",
    //   "httpMethod": "POST",
    //   "id": "youtube.thumbnails.set",
    //   "mediaUpload": {
    //     "accept": [
    //       "application/octet-stream",
    //       "image/jpeg",
    //       "image/png"
    //     ],
    //     "maxSize": "2MB",
    //     "protocols": {
    //       "resumable": {
    //         "multipart": true,
    //         "path": "/resumable/upload/youtube/v3/thumbnails/set"
    //       },
    //       "simple": {
    //         "multipart": true,
    //         "path": "/upload/youtube/v3/thumbnails/set"
    //       }
    //     }
    //   },
    //   "parameterOrder": [
    //     "videoId"
    //   ],
    //   "parameters": {
    //     "onBehalfOfContentOwner": {
    //       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
    //       "location": "query",
    //       "type": "string"
    //     },
    //     "videoId": {
    //       "description": "The videoId parameter specifies a YouTube video ID for which the custom video thumbnail is being provided.",
    //       "location": "query",
    //       "required": true,
    //       "type": "string"
    //     }
    //   },
    //   "path": "thumbnails/set",
    //   "response": {
    //     "$ref": "ThumbnailSetResponse"
    //   },
    //   "scopes": [
    //     "https://www.googleapis.com/auth/youtube",
    //     "https://www.googleapis.com/auth/youtube.force-ssl",
    //     "https://www.googleapis.com/auth/youtube.upload",
    //     "https://www.googleapis.com/auth/youtubepartner"
    //   ],
    //   "supportsMediaUpload": true
    // }
    
}
