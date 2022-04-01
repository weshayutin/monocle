{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NoGeneralisedNewtypeDeriving #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module Monocle.Project where

import Control.Applicative ((<$>), (<*>), (<|>))
import qualified Control.Applicative as Hs
import qualified Control.DeepSeq as Hs
import qualified Control.Monad as Hs
import qualified Data.ByteString as Hs
import qualified Data.Coerce as Hs
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.List.NonEmpty as Hs (NonEmpty (..))
import qualified Data.Map as Hs (Map, mapKeysMonotonic)
import qualified Data.Proxy as Proxy
import qualified Data.String as Hs (fromString)
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Enum as Hs
import qualified GHC.Generics as Hs
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.DotProto as HsProtobuf
import Proto3.Suite.JSONPB ((.:), (.=))
import qualified Proto3.Suite.JSONPB as HsJSONPB
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import qualified Unsafe.Coerce as Hs
import qualified Prelude as Hs

newtype Project = Project {projectFullPath :: Hs.Text}
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named Project where
  nameOf _ = (Hs.fromString "Project")

instance HsProtobuf.HasDefault Project

instance HsProtobuf.Message Project where
  encodeMessage _ Project {projectFullPath = projectFullPath} =
    ( Hs.mconcat
        [ ( HsProtobuf.encodeMessageField
              (HsProtobuf.FieldNumber 1)
              projectFullPath
          )
        ]
    )
  decodeMessage _ =
    (Hs.pure Project)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "full_path")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB Project where
  toJSONPB (Project f1) = (HsJSONPB.object ["full_path" .= f1])
  toEncodingPB (Project f1) = (HsJSONPB.pairs ["full_path" .= f1])

instance HsJSONPB.FromJSONPB Project where
  parseJSONPB =
    ( HsJSONPB.withObject
        "Project"
        (\obj -> (Hs.pure Project) <*> obj .: "full_path")
    )

instance HsJSONPB.ToJSON Project where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON Project where
  parseJSON = HsJSONPB.parseJSONPB
