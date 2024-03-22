import { type NextRequest } from 'next/server';
import * as fs from 'fs';
import path from 'path';
import { xml2js } from 'xml-js';

enum RequestMode {
	CheckAuth = 'checkauth',
	Init = 'init',
	File = 'file',
	Import = 'import',
	Complete = 'complete'
}

const COOKIE_NAME = 'Cookie',
	DATA_EXCHANGE_FOLDER = 'data-exchange',
	DATA_EXCHANGE_MEDIA_FOLDER = 'import_files',
	DATA_EXCHANGE_MEDIA_FOLDER_PATH = DATA_EXCHANGE_FOLDER + '/' + DATA_EXCHANGE_MEDIA_FOLDER,
	IMPORT_PREFIX = 'import',
	OFFERS_PREFIX = 'offers';

function removeAllFilesInFolder(directory: string) {
	fs.readdirSync(directory).forEach(file => fs.unlinkSync(path.join(directory, file)));
}

function exchangeFileProcessing() {
	fs.readdirSync(DATA_EXCHANGE_FOLDER).map(file => {
		if (file.includes(IMPORT_PREFIX)) {

		} else if (file.includes(OFFERS_PREFIX)) {

		}

		const data = fs.readFileSync(`${DATA_EXCHANGE_FOLDER}/${file}`).toString();
		const js = xml2js(data);
		const a = 0;
		// removeAllFilesInFolder(DATA_EXCHANGE_FOLDER);
	});
}

export async function GET(request: NextRequest) {
	const mode = request.nextUrl.searchParams.get('mode'),
		requestHeaders = new Headers(request.headers),
		sessionId = requestHeaders.get(COOKIE_NAME);

	switch (mode) {
		case RequestMode.CheckAuth:
			return new Response(`success\n${COOKIE_NAME}\n123`);
		case RequestMode.Init:
			return new Response('zip=no\nfile_limit=100000000');
		case RequestMode.Import:
			return new Response('success');
		case RequestMode.Complete:
			exchangeFileProcessing();
			break;
		default:
			return new Response(`Unknown mode: ${mode}`, { status: 400 });
	}
}

export async function POST(request: NextRequest) {
	const mode = request.nextUrl.searchParams.get('mode');

	switch (mode) {
		case RequestMode.File:
			try {
				if (!fs.existsSync(DATA_EXCHANGE_FOLDER)) {
					fs.mkdirSync(DATA_EXCHANGE_FOLDER);
					fs.mkdirSync(DATA_EXCHANGE_MEDIA_FOLDER_PATH);
				} else if (!fs.existsSync(DATA_EXCHANGE_MEDIA_FOLDER_PATH)) {
					fs.mkdirSync(DATA_EXCHANGE_MEDIA_FOLDER_PATH);
				}

				const fileName = request.nextUrl.searchParams.get('filename');
				
				if (!fileName) {
					return new Response('File name is empty', { status: 400 });
				}

				if (fileName.includes(DATA_EXCHANGE_MEDIA_FOLDER)) {
					const fileFolder = fileName.split('/');
					if (fileFolder.length !== 3) {
						return new Response(`File name must match the mask: ${DATA_EXCHANGE_MEDIA_FOLDER}/{product article}/{index}.{extension}`, { status: 400 });
					}

					const dataExchangeMediaArticleFolderPath = DATA_EXCHANGE_MEDIA_FOLDER_PATH + '/' + fileFolder[1];
					if (!fs.existsSync(dataExchangeMediaArticleFolderPath)) {
						fs.mkdirSync(dataExchangeMediaArticleFolderPath);
					}

					fs.writeFileSync(`${DATA_EXCHANGE_FOLDER}/${request.nextUrl.searchParams.get('filename')}`, Buffer.from(await request.arrayBuffer()));
				} else {
					fs.writeFileSync(`${DATA_EXCHANGE_FOLDER}/${request.nextUrl.searchParams.get('filename')}`, await request.text());
				}
			} catch (err) {
				console.error(err);
				return new Response('File saving error', { status: 400 });
			}
			return new Response('success');
		default:
			return new Response(`Unknown mode: ${mode}`, { status: 400 });
	}
}