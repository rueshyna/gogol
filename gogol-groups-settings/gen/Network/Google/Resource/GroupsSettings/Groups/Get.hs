{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds      #-}
{-# OPTIONS_GHC -fno-warn-unused-imports    #-}

-- |
-- Module      : Network.Google.Resource.GroupsSettings.Groups.Get
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Gets one resource by id.
--
-- /See:/ <https://developers.google.com/google-apps/groups-settings/get_started Groups Settings API Reference> for @GroupsSettingsGroupsGet@.
module Network.Google.Resource.GroupsSettings.Groups.Get
    (
    -- * REST Resource
      GroupsGetResource

    -- * Creating a Request
    , groupsGet'
    , GroupsGet'

    -- * Request Lenses
    , ggQuotaUser
    , ggPrettyPrint
    , ggUserIP
    , ggKey
    , ggOAuthToken
    , ggGroupUniqueId
    , ggFields
    ) where

import           Network.Google.GroupsSettings.Types
import           Network.Google.Prelude

-- | A resource alias for @GroupsSettingsGroupsGet@ which the
-- 'GroupsGet'' request conforms to.
type GroupsGetResource =
     Capture "groupUniqueId" Text :>
       QueryParam "quotaUser" Text :>
         QueryParam "prettyPrint" Bool :>
           QueryParam "userIp" Text :>
             QueryParam "fields" Text :>
               QueryParam "key" AuthKey :>
                 QueryParam "oauth_token" OAuthToken :>
                   QueryParam "alt" AltJSON :> Get '[JSON] Groups

-- | Gets one resource by id.
--
-- /See:/ 'groupsGet'' smart constructor.
data GroupsGet' = GroupsGet'
    { _ggQuotaUser     :: !(Maybe Text)
    , _ggPrettyPrint   :: !Bool
    , _ggUserIP        :: !(Maybe Text)
    , _ggKey           :: !(Maybe AuthKey)
    , _ggOAuthToken    :: !(Maybe OAuthToken)
    , _ggGroupUniqueId :: !Text
    , _ggFields        :: !(Maybe Text)
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'GroupsGet'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ggQuotaUser'
--
-- * 'ggPrettyPrint'
--
-- * 'ggUserIP'
--
-- * 'ggKey'
--
-- * 'ggOAuthToken'
--
-- * 'ggGroupUniqueId'
--
-- * 'ggFields'
groupsGet'
    :: Text -- ^ 'groupUniqueId'
    -> GroupsGet'
groupsGet' pGgGroupUniqueId_ =
    GroupsGet'
    { _ggQuotaUser = Nothing
    , _ggPrettyPrint = True
    , _ggUserIP = Nothing
    , _ggKey = Nothing
    , _ggOAuthToken = Nothing
    , _ggGroupUniqueId = pGgGroupUniqueId_
    , _ggFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
ggQuotaUser :: Lens' GroupsGet' (Maybe Text)
ggQuotaUser
  = lens _ggQuotaUser (\ s a -> s{_ggQuotaUser = a})

-- | Returns response with indentations and line breaks.
ggPrettyPrint :: Lens' GroupsGet' Bool
ggPrettyPrint
  = lens _ggPrettyPrint
      (\ s a -> s{_ggPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
ggUserIP :: Lens' GroupsGet' (Maybe Text)
ggUserIP = lens _ggUserIP (\ s a -> s{_ggUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
ggKey :: Lens' GroupsGet' (Maybe AuthKey)
ggKey = lens _ggKey (\ s a -> s{_ggKey = a})

-- | OAuth 2.0 token for the current user.
ggOAuthToken :: Lens' GroupsGet' (Maybe OAuthToken)
ggOAuthToken
  = lens _ggOAuthToken (\ s a -> s{_ggOAuthToken = a})

-- | The resource ID
ggGroupUniqueId :: Lens' GroupsGet' Text
ggGroupUniqueId
  = lens _ggGroupUniqueId
      (\ s a -> s{_ggGroupUniqueId = a})

-- | Selector specifying which fields to include in a partial response.
ggFields :: Lens' GroupsGet' (Maybe Text)
ggFields = lens _ggFields (\ s a -> s{_ggFields = a})

instance GoogleAuth GroupsGet' where
        _AuthKey = ggKey . _Just
        _AuthToken = ggOAuthToken . _Just

instance GoogleRequest GroupsGet' where
        type Rs GroupsGet' = Groups
        request = requestWith groupsSettingsRequest
        requestWith rq GroupsGet'{..}
          = go _ggGroupUniqueId _ggQuotaUser
              (Just _ggPrettyPrint)
              _ggUserIP
              _ggFields
              _ggKey
              _ggOAuthToken
              (Just AltJSON)
          where go
                  = clientBuild (Proxy :: Proxy GroupsGetResource) rq